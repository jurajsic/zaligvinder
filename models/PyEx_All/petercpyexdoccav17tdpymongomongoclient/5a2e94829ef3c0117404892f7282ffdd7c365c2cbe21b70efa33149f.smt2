(set-logic QF_SLIA)
;
;
;(set-option :rewrite-divk true)

(declare-fun uri () String)

(assert (and (and (and (not (not (= (ite (not (= (str.len uri) 0)) 1 0) 0))) (not (not (= (ite (str.contains uri ",") 1 0) 0)))) (not (not (= (ite (= (str.len uri) 0) 1 0) 0)))) (not (not (= (ite (str.contains uri "://") 1 0) 0)))))

(check-sat)

;(get-value (uri))