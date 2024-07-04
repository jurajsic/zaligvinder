(set-logic QF_SLIA)

(declare-const str String)
(declare-const x String)
(declare-const var2 Int)
(declare-const var3 Int)

(assert (= x (str.at str var2) ) )


(check-sat)

