(set-logic QF_SLIA)

(declare-const x String)

(assert (str.contains x "efg" ) )
(assert (str.contains x "ef" ) )

(check-sat)

