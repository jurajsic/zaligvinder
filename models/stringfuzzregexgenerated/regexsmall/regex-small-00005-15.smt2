(set-logic QF_SLIA)
(declare-fun var0 () String)
(assert (str.in_re var0 (re.++ (re.* (re.union (str.to_re "0") (str.to_re "111"))) (re.++ (re.* (re.+ (str.to_re "222"))) (re.++ (re.+ (re.union (str.to_re "333") (str.to_re "444"))) (re.++ (re.+ (re.+ (str.to_re "5"))) (re.union (re.* (str.to_re "6")) (re.+ (str.to_re "777")))))))))
(check-sat)