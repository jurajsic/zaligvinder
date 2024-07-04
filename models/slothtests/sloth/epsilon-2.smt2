(set-logic QF_S)


(declare-fun sigmaStar_2 () String)
(declare-fun epsilon () String)
(declare-fun x_3 () String)
(assert (= epsilon ""))
(assert (= x_3 (str.replace epsilon "http://" "https://")))
(assert (str.in_re x_3 (re.++ (re.* re.allchar) (re.++ (str.to_re "/evil") (re.* re.allchar)))))
(check-sat)

