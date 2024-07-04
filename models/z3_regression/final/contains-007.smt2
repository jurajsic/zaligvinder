(set-logic QF_SLIA)

(declare-const x String)
(declare-const bv Bool)

(assert (= bv (str.contains x "ef_k" ) ) )
(assert (= x "efk" ) )


(check-sat)

