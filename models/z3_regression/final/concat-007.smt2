(set-logic QF_SLIA)

(declare-const a String)
(declare-const b String)
(declare-const z String)

(assert (= (str.++ "test" a) "testhello"))

(check-sat)
