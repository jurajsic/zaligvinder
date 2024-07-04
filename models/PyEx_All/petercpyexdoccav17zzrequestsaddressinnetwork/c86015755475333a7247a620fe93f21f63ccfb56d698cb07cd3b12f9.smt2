(set-logic QF_SLIA)
;
;
;(set-option :rewrite-divk true)

(declare-fun network () String)

(assert (not (not (not (= (ite (= (str.len network) 0) 1 0) 0)))))

(check-sat)

;(get-value (network))