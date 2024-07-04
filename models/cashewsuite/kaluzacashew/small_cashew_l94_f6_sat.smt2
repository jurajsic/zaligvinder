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
(assert (= v5 (str.++ "A" (str.++ "B" (str.++ "B" (str.++ "C" (str.++ "D" (str.++ "E" (str.++ "F" (str.++ "G" (str.++ "H" (str.++ "E" (str.++ "I" (str.++ "J" (str.++ "K" (str.++ "L" (str.++ "C" (str.++ "M" (str.++ "E" (str.++ "N" (str.++ "O" "P")))))))))))))))))))))
(assert (not (str.in_re v4 (re.++ (str.to_re "A") (re.++ (str.to_re "B") (re.++ (str.to_re "B") (re.++ (str.to_re "C") (re.++ (str.to_re "D") (re.++ (str.to_re "E") (re.++ (str.to_re "F") (re.++ (str.to_re "G") (re.++ (str.to_re "H") (re.++ (str.to_re "E") (re.++ (str.to_re "I") (re.++ (str.to_re "J") (re.++ (str.to_re "K") (re.++ (str.to_re "L") (re.++ (str.to_re "C") (re.++ (str.to_re "M") (re.++ (str.to_re "E") (re.++ (str.to_re "N") (re.++ (str.to_re "O") (str.to_re "P")))))))))))))))))))))))

(check-sat)

