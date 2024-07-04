(set-logic QF_SLIA)

(declare-const x String)
(declare-const y String)
(declare-const z String)

(assert (= (str.++ x "ab") (str.++ y "k_ghi") ) )

(check-sat)
