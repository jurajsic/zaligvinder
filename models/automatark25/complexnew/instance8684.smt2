(declare-const X String)
; /^([a-zA-Z0-9\.\_\-\&]+)@[a-zA-Z0-9]+\.[a-zA-Z]{3}|(.[a-zA-Z]{2}(\.[a-zA-Z]{2}))$/
(assert (not (str.in_re X (re.union (re.++ (str.to_re "/") (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re ".") (str.to_re "_") (str.to_re "-") (str.to_re "&"))) (str.to_re "@") (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9"))) (str.to_re ".") ((_ re.loop 3 3) (re.union (re.range "a" "z") (re.range "A" "Z")))) (re.++ (str.to_re "/\u{a}") re.allchar ((_ re.loop 2 2) (re.union (re.range "a" "z") (re.range "A" "Z"))) (str.to_re ".") ((_ re.loop 2 2) (re.union (re.range "a" "z") (re.range "A" "Z"))))))))
; Subject\u{3A}User-Agent\u{3A}iebarSubject\u{3A}
(assert (not (str.in_re X (str.to_re "Subject:User-Agent:iebarSubject:\u{a}"))))
; ^(N[BLSTU]|[AMN]B|[BQ]C|ON|PE|SK)$
(assert (not (str.in_re X (re.++ (re.union (re.++ (str.to_re "N") (re.union (str.to_re "B") (str.to_re "L") (str.to_re "S") (str.to_re "T") (str.to_re "U"))) (re.++ (re.union (str.to_re "A") (str.to_re "M") (str.to_re "N")) (str.to_re "B")) (re.++ (re.union (str.to_re "B") (str.to_re "Q")) (str.to_re "C")) (str.to_re "ON") (str.to_re "PE") (str.to_re "SK")) (str.to_re "\u{a}")))))
; /\/3\/[A-Z]{2}\/[a-f0-9]{32}\sHTTP/
(assert (str.in_re X (re.++ (str.to_re "//3/") ((_ re.loop 2 2) (re.range "A" "Z")) (str.to_re "/") ((_ re.loop 32 32) (re.union (re.range "a" "f") (re.range "0" "9"))) (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "HTTP/\u{a}"))))
(check-sat)
