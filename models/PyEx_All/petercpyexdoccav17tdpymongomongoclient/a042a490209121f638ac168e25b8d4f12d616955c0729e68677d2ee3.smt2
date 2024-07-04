(set-logic QF_SLIA)
;
;
;(set-option :rewrite-divk true)

(declare-fun uri () String)

(assert (and (not (not (= (ite (str.prefixof "mongodb://" uri) 1 0) 0))) (not (= (ite (str.contains uri "://") 1 0) 0))))

(check-sat)

;(get-value (uri))