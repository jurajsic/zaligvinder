(set-logic QF_SLIA)
(declare-const X String)
; (^\d{5}\-\d{3}$)|(^\d{2}\.\d{3}\-\d{3}$)|(^\d{8}$)
(assert (not (str.in_re X (re.union (re.++ ((_ re.loop 5 5) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 3 3) (re.range "0" "9"))) (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re ".") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 3 3) (re.range "0" "9"))) (re.++ ((_ re.loop 8 8) (re.range "0" "9")) (str.to_re "\u{a}"))))))
; /\/[a-z0-9]{9}\.jnlp$/U
(assert (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 9 9) (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re ".jnlp/U\u{a}"))))
; Guarded\s+3A\s+data2\.activshopper\.comUser-Agent\u{3A}
(assert (not (str.in_re X (re.++ (str.to_re "Guarded") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "3A") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "data2.activshopper.comUser-Agent:\u{a}")))))
(check-sat)
