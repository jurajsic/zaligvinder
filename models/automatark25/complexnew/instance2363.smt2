(declare-const X String)
; ^(\d{5}-\d{2}-\d{7})*$
(assert (not (str.in_re X (re.++ (re.* (re.++ ((_ re.loop 5 5) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 7 7) (re.range "0" "9")))) (str.to_re "\u{a}")))))
; [^<>/?&{};#]+
(assert (not (str.in_re X (re.++ (re.+ (re.union (str.to_re "<") (str.to_re ">") (str.to_re "/") (str.to_re "?") (str.to_re "&") (str.to_re "{") (str.to_re "}") (str.to_re ";") (str.to_re "#"))) (str.to_re "\u{a}")))))
; (<input )(.*?)(>)
(assert (not (str.in_re X (re.++ (str.to_re "<input ") (re.* re.allchar) (str.to_re ">\u{a}")))))
(check-sat)
