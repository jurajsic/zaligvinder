(declare-const X String)
; (\d{1,3}[\.]\d*)[, ]+-?(\d{1,3}[\.]\d*)
(assert (not (str.in_re X (re.++ (re.+ (re.union (str.to_re ",") (str.to_re " "))) (re.opt (str.to_re "-")) (str.to_re "\u{a}") ((_ re.loop 1 3) (re.range "0" "9")) (str.to_re ".") (re.* (re.range "0" "9")) ((_ re.loop 1 3) (re.range "0" "9")) (str.to_re ".") (re.* (re.range "0" "9"))))))
(check-sat)
