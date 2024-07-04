(set-logic QF_SLIA)

(declare-const x String)
(declare-const y String)

(assert (= y "abcde") )
(assert (= y x) )
(assert (<= (str.len x) 5) )


(check-sat)

