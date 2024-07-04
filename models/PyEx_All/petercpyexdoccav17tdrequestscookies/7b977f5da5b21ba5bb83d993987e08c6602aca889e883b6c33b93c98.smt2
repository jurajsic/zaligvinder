(set-logic QF_SLIA)
;
;
;(set-option :rewrite-divk true)

(declare-fun cookievalue () String)

(assert (and (not (not (not (= (ite (str.contains cookievalue "\\""") 1 0) 0)))) (not (= (ite (str.prefixof """" cookievalue) 1 0) 0))))

(check-sat)

;(get-value (cookievalue))