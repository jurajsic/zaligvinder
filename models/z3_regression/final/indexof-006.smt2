(set-logic QF_SLIA)

(declare-const i Int)

(assert (= i (str.indexof "abcdefg" "hh" 0) ) )

(check-sat)

