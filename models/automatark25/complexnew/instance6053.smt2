(declare-const X String)
; ^(.){0,20}$
(assert (not (str.in_re X (re.++ ((_ re.loop 0 20) re.allchar) (str.to_re "\u{a}")))))
; /^\/\d+\.ld$/U
(assert (str.in_re X (re.++ (str.to_re "//") (re.+ (re.range "0" "9")) (str.to_re ".ld/U\u{a}"))))
(check-sat)
