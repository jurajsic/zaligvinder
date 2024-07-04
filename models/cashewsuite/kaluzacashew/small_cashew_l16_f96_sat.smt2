(set-logic QF_SLIA)


(declare-fun v6 () String)
(declare-fun v0 () String)
(declare-fun v1 () String)
(declare-fun v2 () String)
(declare-fun v3 () String)
(declare-fun v4 () String)
(declare-fun v5 () String)

(assert (= (str.len v0) 0))
(assert (= v1 (str.++ v2 v3)))
(assert (= v2 (str.++ v4 v5)))
(assert (= v6 (str.++ v0 v1)))
(assert (= v5 (str.++ "A" (str.++ "B" (str.++ "C" (str.++ "D" (str.++ "E" (str.++ "F" "G"))))))))
(assert (not (str.in_re v4 (re.++ (str.to_re "A") (re.++ (str.to_re "B") (re.++ (str.to_re "C") (re.++ (str.to_re "D") (re.++ (str.to_re "E") (re.++ (str.to_re "F") (str.to_re "G"))))))))))

(check-sat)

