(declare-const X String)
; ((\(?\d{2,5}\)?)?(\d|-| )?(15((\d|-| ){6,13})))
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") (re.opt (re.++ (re.opt (str.to_re "(")) ((_ re.loop 2 5) (re.range "0" "9")) (re.opt (str.to_re ")")))) (re.opt (re.union (re.range "0" "9") (str.to_re "-") (str.to_re " "))) (str.to_re "15") ((_ re.loop 6 13) (re.union (re.range "0" "9") (str.to_re "-") (str.to_re " ")))))))
(check-sat)
