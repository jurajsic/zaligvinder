(declare-const X String)
; ^[a-zA-Z]([a-zA-Z[._][\d]])*[@][a-zA-Z[.][\d]]*[.][a-z[.][\d]]*
(assert (not (str.in_re X (re.++ (re.union (re.range "a" "z") (re.range "A" "Z")) (re.* (re.++ (re.union (re.range "a" "z") (re.range "A" "Z") (str.to_re "[") (str.to_re ".") (str.to_re "_")) (re.range "0" "9") (str.to_re "]"))) (str.to_re "@") (re.union (re.range "a" "z") (re.range "A" "Z") (str.to_re "[") (str.to_re ".")) (re.range "0" "9") (re.* (str.to_re "]")) (str.to_re ".") (re.union (re.range "a" "z") (str.to_re "[") (str.to_re ".")) (re.range "0" "9") (re.* (str.to_re "]")) (str.to_re "\u{a}")))))
; ^(([A-Z]{1,2}[0-9]{1,2})|([A-Z]{1,2}[0-9][A-Z]))\s?([0-9][A-Z]{2})$
(assert (str.in_re X (re.++ (re.union (re.++ ((_ re.loop 1 2) (re.range "A" "Z")) ((_ re.loop 1 2) (re.range "0" "9"))) (re.++ ((_ re.loop 1 2) (re.range "A" "Z")) (re.range "0" "9") (re.range "A" "Z"))) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "\u{a}") (re.range "0" "9") ((_ re.loop 2 2) (re.range "A" "Z")))))
(check-sat)
