(declare-const X String)
; /^\u{2f}[a-z0-9]{51}$/Ui
(assert (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 51 51) (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re "/Ui\u{a}"))))
(check-sat)
