(declare-const X String)
; weather2ResultX-Sender\u{3A}
(assert (not (str.in_re X (str.to_re "weather2ResultX-Sender:\u{13}\u{a}"))))
; ^[A-Za-z]{1}[0-9]{7}$
(assert (str.in_re X (re.++ ((_ re.loop 1 1) (re.union (re.range "A" "Z") (re.range "a" "z"))) ((_ re.loop 7 7) (re.range "0" "9")) (str.to_re "\u{a}"))))
(check-sat)
