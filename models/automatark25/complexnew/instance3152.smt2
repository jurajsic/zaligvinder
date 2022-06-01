(declare-const X String)
; ^\[0-9]{4}\-\[0-9]{2}\-\[0-9]{2}$
(assert (not (str.in_re X (re.++ (str.to_re "[0-9") ((_ re.loop 4 4) (str.to_re "]")) (str.to_re "-[0-9") ((_ re.loop 2 2) (str.to_re "]")) (str.to_re "-[0-9") ((_ re.loop 2 2) (str.to_re "]")) (str.to_re "\u{a}")))))
; ^0?.[0]{1,2}[1-9]{1}$|^0?.[1-9]{1}?\d{0,2}$|^(1|1.{1}[0]{1,3})$|^0?.[0]{1}[1-9]{1}\d{1}$
(assert (not (str.in_re X (re.union (re.++ (re.opt (str.to_re "0")) re.allchar ((_ re.loop 1 2) (str.to_re "0")) ((_ re.loop 1 1) (re.range "1" "9"))) (re.++ (re.opt (str.to_re "0")) re.allchar ((_ re.loop 1 1) (re.range "1" "9")) ((_ re.loop 0 2) (re.range "0" "9"))) (re.++ (str.to_re "1") ((_ re.loop 1 1) re.allchar) ((_ re.loop 1 3) (str.to_re "0"))) (re.++ (re.opt (str.to_re "0")) re.allchar ((_ re.loop 1 1) (str.to_re "0")) ((_ re.loop 1 1) (re.range "1" "9")) ((_ re.loop 1 1) (re.range "0" "9")) (str.to_re "\u{a}"))))))
(check-sat)
