(set-logic QF_SLIA)
(declare-const X String)
; \u{2A}PORT3\u{2A}\s+Warez.*X-Mailer\u{3A}Subject\u{3A}KEY=
(assert (not (str.in_re X (re.++ (str.to_re "*PORT3*") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Warez") (re.* re.allchar) (str.to_re "X-Mailer:\u{13}Subject:KEY=\u{a}")))))
; ((^\d{8})|(^\d{2}[ ]\d{2}[ ]\d{2}[ ]\d{2})|(^\d{4}[ ]\d{4}))$
(assert (str.in_re X (re.++ (re.union ((_ re.loop 8 8) (re.range "0" "9")) (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re " ") ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re " ") ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re " ") ((_ re.loop 2 2) (re.range "0" "9"))) (re.++ ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re " ") ((_ re.loop 4 4) (re.range "0" "9")))) (str.to_re "\u{a}"))))
(check-sat)
