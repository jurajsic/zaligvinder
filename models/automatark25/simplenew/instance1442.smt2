(declare-const X String)
; ^([1-9]{1}(([0-9])?){2})+(,[0-9]{1}[0-9]{2})*$
(assert (not (str.in_re X (re.++ (re.+ (re.++ ((_ re.loop 1 1) (re.range "1" "9")) ((_ re.loop 2 2) (re.opt (re.range "0" "9"))))) (re.* (re.++ (str.to_re ",") ((_ re.loop 1 1) (re.range "0" "9")) ((_ re.loop 2 2) (re.range "0" "9")))) (str.to_re "\u{a}")))))
(check-sat)
