(declare-const X String)
; User-Agent\u{3A}.*Host\u{3A}\dName=Your\+Host\+is\u{3A}
(assert (not (str.in_re X (re.++ (str.to_re "User-Agent:") (re.* re.allchar) (str.to_re "Host:") (re.range "0" "9") (str.to_re "Name=Your+Host+is:\u{a}")))))
; [\d+]{10}\@[\w]+\.?[\w]+?\.?[\w]+?\.?[\w+]{2,4}/i
(assert (not (str.in_re X (re.++ ((_ re.loop 10 10) (re.union (re.range "0" "9") (str.to_re "+"))) (str.to_re "@") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (re.opt (str.to_re ".")) (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (re.opt (str.to_re ".")) (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (re.opt (str.to_re ".")) ((_ re.loop 2 4) (re.union (str.to_re "+") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "/i\u{a}")))))
(check-sat)
