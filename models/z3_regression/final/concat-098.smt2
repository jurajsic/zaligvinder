(set-logic QF_SLIA)

(declare-const x String)
(declare-const y String)
(declare-const n String)

(assert (= (str.++ "abc" n ) (str.++ x y ) ) ) 
(assert (= (str.len x) 3 ) )

(check-sat)
