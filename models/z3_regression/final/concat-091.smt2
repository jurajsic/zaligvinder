(set-logic QF_SLIA)

(declare-const x String)


(assert (= (str.++ x "b" ) (str.++ "a" x) ) )



(check-sat)
