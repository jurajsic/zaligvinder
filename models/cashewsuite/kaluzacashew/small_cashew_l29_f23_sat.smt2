(set-logic QF_SLIA)


(declare-fun v6 () String)
(declare-fun v0 () String)
(declare-fun v1 () String)
(declare-fun v2 () String)
(declare-fun v3 () String)
(declare-fun v4 () String)
(declare-fun v5 () String)

(assert (= (str.len v0) 0))
(assert (not (= (str.len v1) 0)))
(assert (= v2 (str.++ v3 v4)))
(assert (= v3 (str.++ v5 v6)))
(assert (= v1 (str.++ v0 v2)))
(assert (= v6 (str.++ "A" (str.++ "B" (str.++ "C" (str.++ "D" "E"))))))
(assert (not (str.in_re v5 (re.++ (str.to_re "A") (re.++ (str.to_re "B") (re.++ (str.to_re "C") (re.++ (str.to_re "D") (str.to_re "E"))))))))

(check-sat)

