(set-logic QF_SLIA)
;
;
;(set-option :rewrite-divk true)

(declare-fun k () String)

(assert (not (not (= (ite (not (= k "_id")) 1 0) 0))))

(check-sat)

;(get-value (k))