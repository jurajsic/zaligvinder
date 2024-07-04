(set-logic QF_SLIA)


(declare-fun v0 () String)

(assert (= (str.len v0) 0))
(assert (= v0 v0))
(assert (not (str.in_re v0 (re.++ (str.to_re "A") (re.union (re.+ (str.to_re "B")) (re.++ (re.+ (str.to_re "B")) (str.to_re "C")))))))

(check-sat)

