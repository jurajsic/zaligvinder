(declare-const X String)
; ^\b\d{2,3}-*\d{7}\b$
(assert (not (str.in_re X (re.++ ((_ re.loop 2 3) (re.range "0" "9")) (re.* (str.to_re "-")) ((_ re.loop 7 7) (re.range "0" "9")) (str.to_re "\u{a}")))))
; Cookie\u{3a}.*Host\u{3A}.*ldap\u{3A}\u{2F}\u{2F}
(assert (str.in_re X (re.++ (str.to_re "Cookie:") (re.* re.allchar) (str.to_re "Host:") (re.* re.allchar) (str.to_re "ldap://\u{a}"))))
; ^(([1-9]|[0-2]\d|[3][0-1])\.([1-9]|[0]\d|[1][0-2])\.[2][0]\d{2})$|^(([1-9]|[0-2]\d|[3][0-1])\.([1-9]|[0]\d|[1][0-2])\.[2][0]\d{2}\s([1-9]|[0-1]\d|[2][0-3])\:[0-5]\d)$
(assert (not (str.in_re X (re.union (re.++ (re.union (re.range "1" "9") (re.++ (re.range "0" "2") (re.range "0" "9")) (re.++ (str.to_re "3") (re.range "0" "1"))) (str.to_re ".") (re.union (re.range "1" "9") (re.++ (str.to_re "0") (re.range "0" "9")) (re.++ (str.to_re "1") (re.range "0" "2"))) (str.to_re ".20") ((_ re.loop 2 2) (re.range "0" "9"))) (re.++ (str.to_re "\u{a}") (re.union (re.range "1" "9") (re.++ (re.range "0" "2") (re.range "0" "9")) (re.++ (str.to_re "3") (re.range "0" "1"))) (str.to_re ".") (re.union (re.range "1" "9") (re.++ (str.to_re "0") (re.range "0" "9")) (re.++ (str.to_re "1") (re.range "0" "2"))) (str.to_re ".20") ((_ re.loop 2 2) (re.range "0" "9")) (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (re.union (re.range "1" "9") (re.++ (re.range "0" "1") (re.range "0" "9")) (re.++ (str.to_re "2") (re.range "0" "3"))) (str.to_re ":") (re.range "0" "5") (re.range "0" "9"))))))
(check-sat)
