(set-logic QF_SLIA)

(declare-const x String)
(declare-const y String)


(assert (str.in_re y (re.* (re.* (str.to_re "abcd") ) ) ) )

(assert (= (str.len y)  8) )

(check-sat)


