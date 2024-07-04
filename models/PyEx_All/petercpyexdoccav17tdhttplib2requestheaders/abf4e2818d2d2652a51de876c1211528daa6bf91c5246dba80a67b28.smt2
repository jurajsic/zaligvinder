(set-logic QF_SLIA)
;
;
;(set-option :rewrite-divk true)

(declare-fun headerkey () String)

(assert (not (not (not (= (ite (str.contains headerkey "A") 1 0) 0)))))

(check-sat)

;(get-value (headerkey))