(set-logic QF_SLIA)

(declare-const a String)
(declare-const b String)

(assert (= (str.++ a b) "" ) )

(check-sat)
