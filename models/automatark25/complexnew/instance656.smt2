(set-logic QF_SLIA)
(declare-const X String)
; /STOR fp[0-9A-F]{44}\u{2e}bin/
(assert (str.in_re X (re.++ (str.to_re "/STOR fp") ((_ re.loop 44 44) (re.union (re.range "0" "9") (re.range "A" "F"))) (str.to_re ".bin/\u{a}"))))
; /\/\d+\.mp3$/U
(assert (not (str.in_re X (re.++ (str.to_re "//") (re.+ (re.range "0" "9")) (str.to_re ".mp3/U\u{a}")))))
(check-sat)
