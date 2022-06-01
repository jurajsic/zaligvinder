(declare-const X String)
; ^([0-9]*|\d*\.\d{1}?\d*)$
(assert (not (str.in_re X (re.++ (re.union (re.* (re.range "0" "9")) (re.++ (re.* (re.range "0" "9")) (str.to_re ".") ((_ re.loop 1 1) (re.range "0" "9")) (re.* (re.range "0" "9")))) (str.to_re "\u{a}")))))
; @"^\d[a-zA-Z]\w{1}\d{2}[a-zA-Z]\w{1}\d{3}$"
(assert (not (str.in_re X (re.++ (str.to_re "@\u{22}") (re.range "0" "9") (re.union (re.range "a" "z") (re.range "A" "Z")) ((_ re.loop 1 1) (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) ((_ re.loop 2 2) (re.range "0" "9")) (re.union (re.range "a" "z") (re.range "A" "Z")) ((_ re.loop 1 1) (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "\u{22}\u{a}")))))
(check-sat)
