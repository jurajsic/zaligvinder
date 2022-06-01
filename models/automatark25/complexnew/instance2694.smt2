(declare-const X String)
; (^\d*\.\d{2}$)
(assert (str.in_re X (re.++ (str.to_re "\u{a}") (re.* (re.range "0" "9")) (str.to_re ".") ((_ re.loop 2 2) (re.range "0" "9")))))
; /\/[a-z]{2}\/testcon.php$/U
(assert (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 2 2) (re.range "a" "z")) (str.to_re "/testcon") re.allchar (str.to_re "php/U\u{a}"))))
; (^\-?[0-9]*\.?[0-9]+$)
(assert (str.in_re X (re.++ (str.to_re "\u{a}") (re.opt (str.to_re "-")) (re.* (re.range "0" "9")) (re.opt (str.to_re ".")) (re.+ (re.range "0" "9")))))
; ^[0-9]{5}(-[0-9]{4})?$
(assert (str.in_re X (re.++ ((_ re.loop 5 5) (re.range "0" "9")) (re.opt (re.++ (str.to_re "-") ((_ re.loop 4 4) (re.range "0" "9")))) (str.to_re "\u{a}"))))
(check-sat)
