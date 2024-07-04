(set-logic QF_SLIA)
;
;
;(set-option :rewrite-divk true)

(declare-fun key () String)

(assert (and (not (not (= (ite (= key "www-authenticate") 1 0) 0))) (not (= (ite (= key "www-authenticate") 1 0) 0))))

(check-sat)

;(get-value (key))