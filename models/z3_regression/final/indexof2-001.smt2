(set-logic QF_SLIA)

(declare-const i Int)

(assert (= i (str.indexof "abc" "b" 4) ) )

(check-sat)

