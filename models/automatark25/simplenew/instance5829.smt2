(set-logic QF_SLIA)
(declare-const X String)
; /\u{23}\d{2}\u{3a}\d{2}\u{3a}\d\d$/R
(assert (str.in_re X (re.++ (str.to_re "/#") ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re ":") ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re ":") (re.range "0" "9") (re.range "0" "9") (str.to_re "/R\u{a}"))))
(check-sat)
