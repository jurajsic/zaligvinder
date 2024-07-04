(set-logic QF_SLIA)
(declare-const X String)
; httphostHost\u{3a}Agent\u{22}
(assert (str.in_re X (str.to_re "httphostHost:Agent\u{22}\u{a}")))
; ^R(\d){8}
(assert (not (str.in_re X (re.++ (str.to_re "R") ((_ re.loop 8 8) (re.range "0" "9")) (str.to_re "\u{a}")))))
; ^((18[5-9][0-9])|((19|20)[0-9]{2})|(2100))$
(assert (not (str.in_re X (re.++ (re.union (re.++ (str.to_re "18") (re.range "5" "9") (re.range "0" "9")) (re.++ (re.union (str.to_re "19") (str.to_re "20")) ((_ re.loop 2 2) (re.range "0" "9"))) (str.to_re "2100")) (str.to_re "\u{a}")))))
(check-sat)
