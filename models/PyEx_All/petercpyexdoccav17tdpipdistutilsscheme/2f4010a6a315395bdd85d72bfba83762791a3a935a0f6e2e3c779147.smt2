(set-logic QF_SLIA)
;
;
;(set-option :rewrite-divk true)

(declare-fun scheme () String)

(assert (not (not (= (ite (not (= (str.len scheme) 0)) 1 0) 0))))

(check-sat)

;(get-value (scheme))