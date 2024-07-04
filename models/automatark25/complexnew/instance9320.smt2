(set-logic QF_SLIA)
(declare-const X String)
; ^(#){1}([a-fA-F0-9]){6}$
(assert (not (str.in_re X (re.++ ((_ re.loop 1 1) (str.to_re "#")) ((_ re.loop 6 6) (re.union (re.range "a" "f") (re.range "A" "F") (re.range "0" "9"))) (str.to_re "\u{a}")))))
; /filename=[^\n]*\u{2e}hpj/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".hpj/i\u{a}"))))
; /filename=[^\n]*\u{2e}xcf/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".xcf/i\u{a}"))))
; bind\w+Owner\u{3A}\dBetaWordixqshv\u{2f}qzccs
(assert (str.in_re X (re.++ (str.to_re "bind") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "Owner:") (re.range "0" "9") (str.to_re "BetaWordixqshv/qzccs\u{a}"))))
; href[ ]*=[ ]*('|\")([^\"'])*('|\")
(assert (not (str.in_re X (re.++ (str.to_re "href") (re.* (str.to_re " ")) (str.to_re "=") (re.* (str.to_re " ")) (re.union (str.to_re "'") (str.to_re "\u{22}")) (re.* (re.union (str.to_re "\u{22}") (str.to_re "'"))) (re.union (str.to_re "'") (str.to_re "\u{22}")) (str.to_re "\u{a}")))))
(check-sat)
