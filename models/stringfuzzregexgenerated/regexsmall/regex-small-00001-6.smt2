(set-logic QF_SLIA)
(declare-fun var0 () String)
(assert (str.in_re var0 (re.union (re.union (str.to_re "0") (str.to_re "1")) (re.+ (str.to_re "22")))))
(check-sat)