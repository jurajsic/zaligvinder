(set-logic QF_SLIA)

(declare-const a String)

(assert (= (str.++ a "llo") "testhello" ) )

(check-sat)
