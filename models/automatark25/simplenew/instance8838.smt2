(declare-const X String)
; ^((0{1})?([0-3]{0,1}))(\.[0-9]{0,2})?$|^(4)(\.[0]{1,2})?$|^((0{1})?([0-4]{0,1}))(\.)?$
(assert (not (str.in_re X (re.union (re.++ (re.opt (re.++ (str.to_re ".") ((_ re.loop 0 2) (re.range "0" "9")))) (re.opt ((_ re.loop 1 1) (str.to_re "0"))) (re.opt (re.range "0" "3"))) (re.++ (str.to_re "4") (re.opt (re.++ (str.to_re ".") ((_ re.loop 1 2) (str.to_re "0"))))) (re.++ (re.opt (str.to_re ".")) (str.to_re "\u{a}") (re.opt ((_ re.loop 1 1) (str.to_re "0"))) (re.opt (re.range "0" "4")))))))
(check-sat)
