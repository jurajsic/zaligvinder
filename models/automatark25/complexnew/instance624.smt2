(declare-const X String)
; /^Content-Type\u{3a}[\u{20}\u{9}]+application\/x-msdos-program/smiH
(assert (str.in_re X (re.++ (str.to_re "/Content-Type:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}"))) (str.to_re "application/x-msdos-program/smiH\u{a}"))))
; ^([A-Z]{0,3}?[0-9]{9}($[0-9]{0}|[A-Z]{1}))
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") ((_ re.loop 0 3) (re.range "A" "Z")) ((_ re.loop 9 9) (re.range "0" "9")) (re.union ((_ re.loop 0 0) (re.range "0" "9")) ((_ re.loop 1 1) (re.range "A" "Z")))))))
; (^\d{5}-\d{3}|^\d{2}.\d{3}-\d{3}|\d{8})
(assert (not (str.in_re X (re.++ (re.union (re.++ ((_ re.loop 5 5) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 3 3) (re.range "0" "9"))) (re.++ ((_ re.loop 2 2) (re.range "0" "9")) re.allchar ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 3 3) (re.range "0" "9"))) ((_ re.loop 8 8) (re.range "0" "9"))) (str.to_re "\u{a}")))))
(check-sat)
