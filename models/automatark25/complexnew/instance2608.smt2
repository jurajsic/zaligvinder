(declare-const X String)
; ('{2})*([^'\r\n]*)('{2})*([^'\r\n]*)('{2})*
(assert (not (str.in_re X (re.++ (re.* ((_ re.loop 2 2) (str.to_re "'"))) (re.* (re.union (str.to_re "'") (str.to_re "\u{d}") (str.to_re "\u{a}"))) (re.* ((_ re.loop 2 2) (str.to_re "'"))) (re.* (re.union (str.to_re "'") (str.to_re "\u{d}") (str.to_re "\u{a}"))) (re.* ((_ re.loop 2 2) (str.to_re "'"))) (str.to_re "\u{a}")))))
; (\bprotected\b.*(public))|(\bprivate\b.*(protected))|(\bprivate\b.*(public))
(assert (str.in_re X (re.union (re.++ (str.to_re "protected") (re.* re.allchar) (str.to_re "public")) (re.++ (str.to_re "private") (re.* re.allchar) (str.to_re "protected")) (re.++ (str.to_re "\u{a}private") (re.* re.allchar) (str.to_re "public")))))
(check-sat)
