(set-logic QF_SLIA)

(declare-const x String)
(declare-const y String)


(assert (str.in_re x (re.* (str.to_re "ab") ) ) )
(assert (str.in_re y (re.* (str.to_re "ab") ) ) )

(assert (= (str.len x)  2) )
(assert (= (str.len y)  4) )

(check-sat)


