(declare-const X String)
; ^([a-z0-9]+([\-a-z0-9]*[a-z0-9]+)?\.){0,}([a-z0-9]+([\-a-z0-9]*[a-z0-9]+)?){1,63}(\.[a-z0-9]{2,7})+$
(assert (str.in_re X (re.++ (re.* (re.++ (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (re.opt (re.++ (re.* (re.union (str.to_re "-") (re.range "a" "z") (re.range "0" "9"))) (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))))) (str.to_re "."))) ((_ re.loop 1 63) (re.++ (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (re.opt (re.++ (re.* (re.union (str.to_re "-") (re.range "a" "z") (re.range "0" "9"))) (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))))))) (re.+ (re.++ (str.to_re ".") ((_ re.loop 2 7) (re.union (re.range "a" "z") (re.range "0" "9"))))) (str.to_re "\u{a}"))))
(check-sat)
