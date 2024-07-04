(set-logic QF_SLIA)

(declare-const x String)

(assert (not (str.contains x "ef" ) ) )
(assert (str.contains x "efg" ) )


(check-sat)

