(set-logic QF_SLIA)

(declare-const x String)
(declare-const vi1 Int)


(assert (= x "aaaaefg" ) )
(assert (= vi1 (str.indexof x "mln" 0) ) )


(check-sat)

