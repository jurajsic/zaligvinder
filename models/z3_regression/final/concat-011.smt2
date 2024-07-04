(set-logic QF_SLIA)

(declare-const a String)
(declare-const b String)
(declare-const z String)

(assert (= (str.++ "test" (str.++ "hello" a) ) "testhellonum"))

(check-sat)
