(declare-const X String)
; (^\d{3,5}\,\d{2}$)|(^\d{3,5}$)
(assert (str.in_re X (re.union (re.++ ((_ re.loop 3 5) (re.range "0" "9")) (str.to_re ",") ((_ re.loop 2 2) (re.range "0" "9"))) (re.++ ((_ re.loop 3 5) (re.range "0" "9")) (str.to_re "\u{a}")))))
(check-sat)
