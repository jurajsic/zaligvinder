(declare-const X String)
; (0|(\+)?([1-9]{1}[0-9]{0,1}|[1]{1}[0-9]{0,2}|[2]{1}([0-4]{1}[0-9]{1}|[5]{1}[0-5]{1})))
(assert (not (str.in_re X (re.++ (re.union (str.to_re "0") (re.++ (re.opt (str.to_re "+")) (re.union (re.++ ((_ re.loop 1 1) (re.range "1" "9")) (re.opt (re.range "0" "9"))) (re.++ ((_ re.loop 1 1) (str.to_re "1")) ((_ re.loop 0 2) (re.range "0" "9"))) (re.++ ((_ re.loop 1 1) (str.to_re "2")) (re.union (re.++ ((_ re.loop 1 1) (re.range "0" "4")) ((_ re.loop 1 1) (re.range "0" "9"))) (re.++ ((_ re.loop 1 1) (str.to_re "5")) ((_ re.loop 1 1) (re.range "0" "5")))))))) (str.to_re "\u{a}")))))
(check-sat)
