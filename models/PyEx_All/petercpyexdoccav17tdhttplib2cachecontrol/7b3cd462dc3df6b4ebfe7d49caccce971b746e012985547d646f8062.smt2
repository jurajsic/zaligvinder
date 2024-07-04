(set-logic QF_SLIA)
;
;
;(set-option :rewrite-divk true)

(declare-fun key () String)
(declare-fun value () String)

(assert (and (and (and (and (not (not (not (= (ite (not (= (str.indexof value "=" 0) (- 1))) 1 0) 0)))) (not (not (= (ite (str.contains value ",") 1 0) 0)))) (not (not (= (ite (= (str.len value) 0) 1 0) 0)))) (not (= (ite (= key "cache-control") 1 0) 0))) (not (= (ite (= key "cache-control") 1 0) 0))))

(check-sat)

;(get-value (key))
;(get-value (value))