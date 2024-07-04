(set-logic QF_SLIA)
(declare-fun var0 () String)
(assert (str.in_re var0 (re.* (re.+ (str.to_re "00")))))
(check-sat)