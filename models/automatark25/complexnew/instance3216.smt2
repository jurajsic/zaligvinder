(declare-const X String)
; /^\/\d{10}\/\d{10}\.tpl$/U
(assert (not (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 10 10) (re.range "0" "9")) (str.to_re "/") ((_ re.loop 10 10) (re.range "0" "9")) (str.to_re ".tpl/U\u{a}")))))
; zmnjgmomgbdz\u{2f}zzmw\.gzt\d+Ready
(assert (not (str.in_re X (re.++ (str.to_re "zmnjgmomgbdz/zzmw.gzt") (re.+ (re.range "0" "9")) (str.to_re "Ready\u{a}")))))
(check-sat)
