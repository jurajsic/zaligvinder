(set-logic QF_SLIA)
(declare-const X String)
; /filename=[^\n]*\u{2e}ppsx/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".ppsx/i\u{a}")))))
; for mobile:^[0][1-9]{1}[0-9]{9}$
(assert (not (str.in_re X (re.++ (str.to_re "for mobile:0") ((_ re.loop 1 1) (re.range "1" "9")) ((_ re.loop 9 9) (re.range "0" "9")) (str.to_re "\u{a}")))))
(check-sat)
