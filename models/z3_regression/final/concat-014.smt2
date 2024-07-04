(set-logic QF_SLIA)

(declare-const a String)

(assert (= (str.++ a "") "num" ) )

(check-sat)
