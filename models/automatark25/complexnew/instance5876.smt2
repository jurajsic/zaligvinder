(set-logic QF_SLIA)
(declare-const X String)
; /STOR fp[0-9A-F]{44}\u{2e}bin/
(assert (not (str.in_re X (re.++ (str.to_re "/STOR fp") ((_ re.loop 44 44) (re.union (re.range "0" "9") (re.range "A" "F"))) (str.to_re ".bin/\u{a}")))))
; ^(05)[0-9]{8}$
(assert (not (str.in_re X (re.++ (str.to_re "05") ((_ re.loop 8 8) (re.range "0" "9")) (str.to_re "\u{a}")))))
; engineResultUser-Agent\u{3A}
(assert (not (str.in_re X (str.to_re "engineResultUser-Agent:\u{a}"))))
; /filename=[^\n]*\u{2e}svg/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".svg/i\u{a}"))))
(check-sat)
