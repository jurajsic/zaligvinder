(set-logic QF_SLIA)

(declare-const x String)
(declare-const y String)
(declare-const m String)
(declare-const n String)



(assert (str.in_re x (re.++ (str.to_re "a") (re.* (str.to_re "b") ) ) ) )

(assert (str.in_re x (re.++ (str.to_re "c") (re.* (str.to_re "c") ) ) ) )

(assert (str.in_re x (re.++ (str.to_re "a") (re.++ (re.* (str.to_re "b") ) (re.* (str.to_re "c") ) ) ) ) )

;(assert (str.in_re s (re.inter
;  (re.++ (str.to_re "a") (re.* (str.to_re "b")) 
;    (re.inter (str.to_re "c") (re.* (str.to_re "c"))))
;  (re.++ (str.to_re "a") (re.* (str.to_re "b")) (re.* (str.to_re "c")))
;  )))




(check-sat)


