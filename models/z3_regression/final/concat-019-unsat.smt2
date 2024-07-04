(set-logic QF_SLIA)

(declare-const a String)

(assert (= (str.++ a "testhello") "test" ) )

(check-sat)
