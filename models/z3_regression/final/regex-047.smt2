(set-logic QF_S)


(declare-const key String)
(declare-const val String)

(define-fun QuoteRegex ((aRegex (RegEx String) )) (RegEx String)
    (re.++ (re.++ (str.to_re """") aRegex) (str.to_re """")))

(assert (str.in_re key (QuoteRegex (re.* (str.to_re "a")))))

(assert (= (str.len key) 2)) 


(check-sat)

