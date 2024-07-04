(set-logic QF_SLIA)

(declare-const x String)
(declare-const y String)

(assert (= (str.len (str.++ x y)) 1) )

(check-sat)


