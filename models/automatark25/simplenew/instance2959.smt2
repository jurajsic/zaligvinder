(declare-const X String)
; ^((\+)?[1-9]{1,2})?([-\s\.])?((\(\d{1,4}\))|\d{1,4})(([-\s\.])?[0-9]{1,12}){1,2}$
(assert (str.in_re X (re.++ (re.opt (re.++ (re.opt (str.to_re "+")) ((_ re.loop 1 2) (re.range "1" "9")))) (re.opt (re.union (str.to_re "-") (str.to_re ".") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.union (re.++ (str.to_re "(") ((_ re.loop 1 4) (re.range "0" "9")) (str.to_re ")")) ((_ re.loop 1 4) (re.range "0" "9"))) ((_ re.loop 1 2) (re.++ (re.opt (re.union (str.to_re "-") (str.to_re ".") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 1 12) (re.range "0" "9")))) (str.to_re "\u{a}"))))
(check-sat)
