(declare-const X String)
; &#\d{2,5};
(assert (not (str.in_re X (re.++ (str.to_re "&#") ((_ re.loop 2 5) (re.range "0" "9")) (str.to_re ";\u{a}")))))
(check-sat)
