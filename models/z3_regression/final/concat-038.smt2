(set-logic QF_SLIA)

(declare-const x String)
(declare-const y String)
(declare-const z String)

(assert (= (str.++ x y) (str.++ z "abc") ) )
(assert (= (str.len z) 0 ) )
(assert (= (str.len x) 0 ) )

(check-sat)
