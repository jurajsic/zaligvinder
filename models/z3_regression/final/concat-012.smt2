(set-logic QF_SLIA)

(declare-const x String)
(declare-const y String)
(declare-const z String)

(assert (=  "testnumnum" (str.++ y (str.++ "num" x) ) ) )

(check-sat)
