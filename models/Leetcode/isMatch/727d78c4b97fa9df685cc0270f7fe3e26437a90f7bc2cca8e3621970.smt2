(set-logic QF_SLIA)

(declare-fun s () String)
(declare-fun p () String)

(assert (not (not (= (ite (= s p) 1 0) 0))))

(check-sat)

;(get-value (s))
;(get-value (p))





