(declare-const X String)
; /\/\[fx]\.jar$/U
(assert (str.in_re X (str.to_re "//[fx].jar/U\u{a}")))
; /[1-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}/H
(assert (str.in_re X (re.++ (str.to_re "/") ((_ re.loop 8 8) (re.union (re.range "1" "9") (re.range "A" "F"))) (str.to_re "-") ((_ re.loop 4 4) (re.union (re.range "0" "9") (re.range "A" "F"))) (str.to_re "-") ((_ re.loop 4 4) (re.union (re.range "0" "9") (re.range "A" "F"))) (str.to_re "-") ((_ re.loop 4 4) (re.union (re.range "0" "9") (re.range "A" "F"))) (str.to_re "-") ((_ re.loop 12 12) (re.union (re.range "0" "9") (re.range "A" "F"))) (str.to_re "/H\u{a}"))))
(check-sat)
