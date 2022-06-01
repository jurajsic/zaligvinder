(declare-const X String)
; ^.+@[^\.].+\.[a-z]{2,}(\.[a-z]{2,}$|$)
(assert (str.in_re X (re.++ (re.+ re.allchar) (str.to_re "@") (re.comp (str.to_re ".")) (re.+ re.allchar) (str.to_re ".\u{a}") ((_ re.loop 2 2) (re.range "a" "z")) (re.* (re.range "a" "z")) (str.to_re ".") ((_ re.loop 2 2) (re.range "a" "z")) (re.* (re.range "a" "z")))))
; /\.js\/\?[a-z]+\=[a-z]{1,4}/R
(assert (not (str.in_re X (re.++ (str.to_re "/.js/?") (re.+ (re.range "a" "z")) (str.to_re "=") ((_ re.loop 1 4) (re.range "a" "z")) (str.to_re "/R\u{a}")))))
(check-sat)
