(set-logic QF_SLIA)
(declare-fun var0 () String)
(assert (str.in_re var0 (re.* (re.union (str.to_re "000") (str.to_re "11")))))
(check-sat)