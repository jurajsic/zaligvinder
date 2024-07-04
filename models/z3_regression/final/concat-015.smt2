(set-logic QF_SLIA)

(declare-const a String)
(declare-const b String)

(assert (or (= (str.++ a b) "te" )  (= (str.++ b a) "te" ) ) )
(assert (= b "t" ) )

(check-sat)
