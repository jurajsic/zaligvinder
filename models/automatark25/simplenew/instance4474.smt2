(declare-const X String)
; ^([0]{0,1}[0-7]{3})$
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") (re.opt (str.to_re "0")) ((_ re.loop 3 3) (re.range "0" "7"))))))
(check-sat)
