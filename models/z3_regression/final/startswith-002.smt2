(set-logic QF_SLIA)

(declare-const x String)
(declare-const z String)
(declare-const b1 Bool)

(assert (= false (str.prefixof "nba" x) ) )



(check-sat)

