(declare-const X String)
; (([1-9]|[0][1-9])|1[012])[- /.](([1-9]|[0][1-9])|[12][0-9]|3[01])[- /.](19|20)\d\d
(assert (str.in_re X (re.++ (re.union (re.++ (str.to_re "1") (re.union (str.to_re "0") (str.to_re "1") (str.to_re "2"))) (re.range "1" "9") (re.++ (str.to_re "0") (re.range "1" "9"))) (re.union (str.to_re "-") (str.to_re " ") (str.to_re "/") (str.to_re ".")) (re.union (re.++ (re.union (str.to_re "1") (str.to_re "2")) (re.range "0" "9")) (re.++ (str.to_re "3") (re.union (str.to_re "0") (str.to_re "1"))) (re.range "1" "9") (re.++ (str.to_re "0") (re.range "1" "9"))) (re.union (str.to_re "-") (str.to_re " ") (str.to_re "/") (str.to_re ".")) (re.union (str.to_re "19") (str.to_re "20")) (re.range "0" "9") (re.range "0" "9") (str.to_re "\u{a}"))))
(check-sat)
