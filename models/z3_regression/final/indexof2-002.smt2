(set-logic QF_SLIA)

(declare-const i Int)

(assert (= i (str.indexof "abc" "b" 1) ) )

(check-sat)

