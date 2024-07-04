(set-logic QF_SLIA)

(declare-const vi1 Int)
(declare-const vi2 Int)
(declare-const x String)


(assert (= "efg" (str.substr x 1 3) ) )
(assert (= "bef" (str.substr x 0 3) ) )



(check-sat)

