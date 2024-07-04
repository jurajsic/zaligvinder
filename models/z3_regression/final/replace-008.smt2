(set-logic QF_SLIA)

(declare-const x String)
(declare-const y String)


(assert (= y (str.replace "mn_efgefg_k" "efg" "abcd")  ) )


(check-sat)
