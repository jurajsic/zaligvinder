(set-logic QF_SLIA)

(declare-const x String)

(assert (not (str.contains x "efg" ) ) )

(check-sat)

