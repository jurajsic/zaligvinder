(set-logic QF_SLIA)

(declare-const a String)

(assert (= (str.++ "tesk" a) "testhello" ) )

(check-sat)
