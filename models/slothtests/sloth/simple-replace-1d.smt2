(set-logic QF_SLIA)

(declare-fun x_7 () String)
(declare-fun x_10 () String)

(assert (= x_7 (str.replace "HelloWorld" "e" "")))
(assert (= x_7 "hlloWorld"))

(check-sat)
