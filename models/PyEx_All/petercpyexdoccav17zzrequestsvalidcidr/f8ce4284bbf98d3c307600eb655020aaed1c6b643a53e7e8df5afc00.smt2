(set-logic QF_SLIA)
;
;
;(set-option :rewrite-divk true)

(declare-fun address () String)

(assert (not (not (not (= (ite (str.contains address "/") 1 0) 0)))))

(check-sat)

;(get-value (address))