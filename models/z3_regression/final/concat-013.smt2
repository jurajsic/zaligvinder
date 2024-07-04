(set-logic QF_SLIA)

(declare-const x String)
(declare-const y String)
(declare-const z String)

(assert (= (str.++ z "b") (str.++ x y) ) )
(assert (= z "") )

(check-sat)
