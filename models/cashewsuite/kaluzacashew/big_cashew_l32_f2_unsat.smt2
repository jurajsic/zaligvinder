(set-logic QF_SLIA)


(declare-fun v0 () String)

(assert (= (str.len v0) 0))
(assert (not (= (str.len v0) 0)))

(check-sat)

