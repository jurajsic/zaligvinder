(set-logic QF_SLIA)


(declare-const x String)

(assert (str.in_re x (re.+ (str.to_re "a") ) ) )

(assert (> 1 (str.len x) ) )


(check-sat)

