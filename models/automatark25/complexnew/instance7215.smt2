(declare-const X String)
; as\u{2E}starware\u{2E}com.*Casino.*LOG.*FilteredHost\u{3A}e2give\.com\u{2F}newsurfer4\u{2F}
(assert (str.in_re X (re.++ (str.to_re "as.starware.com") (re.* re.allchar) (str.to_re "Casino") (re.* re.allchar) (str.to_re "LOG") (re.* re.allchar) (str.to_re "FilteredHost:e2give.com/newsurfer4/\u{a}"))))
; ^[^_][a-zA-Z0-9_]+[^_]@{1}[a-z]+[.]{1}(([a-z]{2,3})|([a-z]{2,3}[.]{1}[a-z]{2,3}))$
(assert (not (str.in_re X (re.++ (re.comp (str.to_re "_")) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_"))) (re.comp (str.to_re "_")) ((_ re.loop 1 1) (str.to_re "@")) (re.+ (re.range "a" "z")) ((_ re.loop 1 1) (str.to_re ".")) (re.union ((_ re.loop 2 3) (re.range "a" "z")) (re.++ ((_ re.loop 2 3) (re.range "a" "z")) ((_ re.loop 1 1) (str.to_re ".")) ((_ re.loop 2 3) (re.range "a" "z")))) (str.to_re "\u{a}")))))
(check-sat)
