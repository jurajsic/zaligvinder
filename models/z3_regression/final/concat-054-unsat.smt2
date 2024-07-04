(set-logic QF_SLIA)

(declare-const x String)
(declare-const y String)
(declare-const z String)

(assert (= (str.++ "abkefgh" x) (str.++ "abc" y) ) )

(check-sat)
