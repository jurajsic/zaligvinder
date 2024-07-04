(set-logic QF_SLIA)
;
;
;(set-option :rewrite-divk true)

(declare-fun uri () String)

(assert (not (not (= (ite (str.contains uri "://") 1 0) 0))))

(check-sat)

;(get-value (uri))