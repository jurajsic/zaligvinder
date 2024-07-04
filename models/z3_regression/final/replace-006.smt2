(set-logic QF_SLIA)

(declare-const x String)
(declare-const y String)

(assert (= y (str.replace x "efg" "abcd")  ) )
(assert (= x "efg") )

(check-sat)
