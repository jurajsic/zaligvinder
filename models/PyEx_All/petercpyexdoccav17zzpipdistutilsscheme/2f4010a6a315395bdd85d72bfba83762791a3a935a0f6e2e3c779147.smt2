(set-logic QF_SLIA)
;
;
;(set-option :rewrite-divk true)

(declare-fun scheme () String)

(assert (and (not (not (= (ite (not (= (str.len scheme) 0)) 1 0) 0))) (not (= (ite (not (= (str.len scheme) 0)) 1 0) 0))))

(check-sat)

;(get-value (scheme))