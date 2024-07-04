(set-logic QF_SLIA)

(declare-const x String)
(declare-const i Int)

(assert (= (str.len "abcd") i) )
(assert (> (str.len x) (+ i 1) ) )

(check-sat)

