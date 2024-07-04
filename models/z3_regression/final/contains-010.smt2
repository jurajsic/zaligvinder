(set-logic QF_SLIA)

(declare-const x String)

(assert (str.contains x "efg" ) )
(assert (str.contains x "ef" ) )
(assert (< (str.len x) 5) )


(check-sat)

