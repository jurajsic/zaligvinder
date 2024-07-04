(set-logic QF_SLIA)

(declare-const x String)
(declare-const bv Bool)

(assert (= bv (str.contains "abcdefg" x ) ) )
(assert bv )


(check-sat)

