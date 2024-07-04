(set-logic QF_SLIA)


(declare-fun v6 () String)
(declare-fun v0 () String)
(declare-fun v1 () String)
(declare-fun v2 () String)
(declare-fun v3 () String)
(declare-fun v4 () String)
(declare-fun v5 () String)

(assert (= (str.len v0) 0))
(assert (<= (str.len v1) 5))
(assert (>= (str.len v1) 5))
(assert (= v2 "A"))
(assert (= v3 (str.++ v4 v5)))
(assert (= v4 (str.++ v1 v2)))
(assert (= v6 (str.++ v0 v3)))
(assert (not (str.in_re v1 (str.to_re "A"))))

(check-sat)

