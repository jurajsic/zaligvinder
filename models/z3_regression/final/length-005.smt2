(set-logic QF_SLIA)

(declare-const x String)
(declare-const y String)

(assert (= "abcd" (str.++ x y) ) )
(assert (>= (str.len y) 3) )
(assert (>= (str.len x) 1) )

(check-sat)

