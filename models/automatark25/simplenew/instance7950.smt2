(declare-const X String)
; ^[0-9]{0,5}[ ]{0,1}[0-9]{0,6}$
(assert (not (str.in_re X (re.++ ((_ re.loop 0 5) (re.range "0" "9")) (re.opt (str.to_re " ")) ((_ re.loop 0 6) (re.range "0" "9")) (str.to_re "\u{a}")))))
(check-sat)
