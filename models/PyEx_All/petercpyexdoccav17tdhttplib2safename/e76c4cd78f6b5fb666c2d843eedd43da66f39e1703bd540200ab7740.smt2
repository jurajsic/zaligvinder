(set-logic QF_SLIA)
;
;
;(set-option :rewrite-divk true)

(declare-fun url () String)

(assert (not (not (= (ite (not (= (str.len url) 0)) 1 0) 0))))

(check-sat)

;(get-value (url))