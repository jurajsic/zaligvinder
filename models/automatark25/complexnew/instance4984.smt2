(set-logic QF_SLIA)
(declare-const X String)
; ([0-1][0-9]|2[0-4]):(0[0-9]|[1-5][0-9]):(0[0-9]|[1-5][0-9])(\.[0-999])?((\+|-)([0-1][0-9]|2[0-4]):(0[0-9]|[1-5][0-9])|Z)?
(assert (not (str.in_re X (re.++ (re.union (re.++ (re.range "0" "1") (re.range "0" "9")) (re.++ (str.to_re "2") (re.range "0" "4"))) (str.to_re ":") (re.union (re.++ (str.to_re "0") (re.range "0" "9")) (re.++ (re.range "1" "5") (re.range "0" "9"))) (str.to_re ":") (re.union (re.++ (str.to_re "0") (re.range "0" "9")) (re.++ (re.range "1" "5") (re.range "0" "9"))) (re.opt (re.++ (str.to_re ".") (re.union (re.range "0" "9") (str.to_re "9")))) (re.opt (re.union (re.++ (re.union (str.to_re "+") (str.to_re "-")) (re.union (re.++ (re.range "0" "1") (re.range "0" "9")) (re.++ (str.to_re "2") (re.range "0" "4"))) (str.to_re ":") (re.union (re.++ (str.to_re "0") (re.range "0" "9")) (re.++ (re.range "1" "5") (re.range "0" "9")))) (str.to_re "Z"))) (str.to_re "\u{a}")))))
; (^[0]{1}$|^[-]?[1-9]{1}\d*$)
(assert (str.in_re X (re.++ (re.union ((_ re.loop 1 1) (str.to_re "0")) (re.++ (re.opt (str.to_re "-")) ((_ re.loop 1 1) (re.range "1" "9")) (re.* (re.range "0" "9")))) (str.to_re "\u{a}"))))
; ^[0]*?[1-9]\d*\.?[0]*$
(assert (str.in_re X (re.++ (re.* (str.to_re "0")) (re.range "1" "9") (re.* (re.range "0" "9")) (re.opt (str.to_re ".")) (re.* (str.to_re "0")) (str.to_re "\u{a}"))))
; com\u{2F}index\.php\?tpid=.*pop\u{2E}popuptoast\u{2E}com.*Host\u{3A}
(assert (str.in_re X (re.++ (str.to_re "com/index.php?tpid=") (re.* re.allchar) (str.to_re "pop.popuptoast.com") (re.* re.allchar) (str.to_re "Host:\u{a}"))))
(check-sat)
