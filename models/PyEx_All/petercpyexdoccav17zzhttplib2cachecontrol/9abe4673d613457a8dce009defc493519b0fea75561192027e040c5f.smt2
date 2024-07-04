(set-logic QF_SLIA)
;
;
;(set-option :rewrite-divk true)

(declare-fun key () String)

(assert (not (not (= (ite (= key "cache-control") 1 0) 0))))

(check-sat)

;(get-value (key))