(set-logic QF_SLIA)

(declare-const x String)
(declare-const z String)
(declare-const b1 Bool)

(assert (= false (str.suffixof x "nba") ) )



(check-sat)

