(declare-const X String)
; ^\s*[a-zA-Z\s]+\,[0-9\s]+\s*$
(assert (not (str.in_re X (re.++ (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re ",") (re.+ (re.union (re.range "0" "9") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "\u{a}")))))
; /^(\/\d{8,11})?(\/\d)?\/1[34]\d{8}\.htm$/U
(assert (not (str.in_re X (re.++ (str.to_re "/") (re.opt (re.++ (str.to_re "/") ((_ re.loop 8 11) (re.range "0" "9")))) (re.opt (re.++ (str.to_re "/") (re.range "0" "9"))) (str.to_re "/1") (re.union (str.to_re "3") (str.to_re "4")) ((_ re.loop 8 8) (re.range "0" "9")) (str.to_re ".htm/U\u{a}")))))
(check-sat)
