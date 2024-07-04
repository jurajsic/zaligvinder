(set-logic QF_SLIA)

(declare-const x String)
(declare-const y1 String)
(declare-const y2 String)


(assert (= x ( str.++ ( str.++ "te" y1 ) ( str.++ "st" y2 ) ) ) )


(check-sat)
