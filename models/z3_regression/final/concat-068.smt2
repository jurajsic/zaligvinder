(set-logic QF_SLIA)

(declare-const x String)
(declare-const y String)
(declare-const z String)

(assert (= z (str.++ "a" x ) ) ) 
(assert (= z (str.++ y "c" ) ) )
(assert (= (str.len x) 1 ) )

(check-sat)
