(declare-const X String)
; /\/index\d{9}\.asp/i
(assert (str.in_re X (re.++ (str.to_re "//index") ((_ re.loop 9 9) (re.range "0" "9")) (str.to_re ".asp/i\u{a}"))))
(check-sat)
