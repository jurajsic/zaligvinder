(declare-const X String)
; [\+]?[1]?[-. ]?(\(\d{3}\)|\d{3})(|[-. ])?\d{3}(|[-. ])\d{4}|\d{3}(|[-. ])\d{4}
(assert (not (str.in_re X (re.union (re.++ (re.opt (str.to_re "+")) (re.opt (str.to_re "1")) (re.opt (re.union (str.to_re "-") (str.to_re ".") (str.to_re " "))) (re.union (re.++ (str.to_re "(") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re ")")) ((_ re.loop 3 3) (re.range "0" "9"))) (re.opt (re.union (str.to_re "-") (str.to_re ".") (str.to_re " "))) ((_ re.loop 3 3) (re.range "0" "9")) (re.union (str.to_re "-") (str.to_re ".") (str.to_re " ")) ((_ re.loop 4 4) (re.range "0" "9"))) (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (re.union (str.to_re "-") (str.to_re ".") (str.to_re " ")) ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}"))))))
; ^(\s*\d\s*){11}$
(assert (str.in_re X (re.++ ((_ re.loop 11 11) (re.++ (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.range "0" "9") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))))) (str.to_re "\u{a}"))))
(check-sat)
