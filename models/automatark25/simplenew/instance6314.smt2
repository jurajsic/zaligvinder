(declare-const X String)
; ([^\w]+)|([^A-Za-z])|(\b[^aeiouy]+\b)|(\b(\w{2})\b)
(assert (not (str.in_re X (re.union (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (re.+ (re.union (str.to_re "a") (str.to_re "e") (str.to_re "i") (str.to_re "o") (str.to_re "u") (str.to_re "y"))) (re.++ ((_ re.loop 2 2) (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "\u{a}")) (re.range "A" "Z") (re.range "a" "z")))))
(check-sat)
