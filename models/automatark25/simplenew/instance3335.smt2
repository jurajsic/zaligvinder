(declare-const X String)
; /\/ddd\/[a-z]{2}.gif/iU
(assert (not (str.in_re X (re.++ (str.to_re "//ddd/") ((_ re.loop 2 2) (re.range "a" "z")) re.allchar (str.to_re "gif/iU\u{a}")))))
(check-sat)
