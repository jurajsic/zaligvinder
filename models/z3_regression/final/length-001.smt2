(set-logic QF_SLIA)

(declare-const i Int)
(declare-const x String)

(assert (>= 3 ( str.len x ) ) )


(check-sat)
