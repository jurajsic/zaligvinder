(declare-const X String)
; ^((0?[1-9]|[12][0-9]|3[01])[\/](0?[1-9]|1[0-2]))$
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") (re.union (re.++ (re.opt (str.to_re "0")) (re.range "1" "9")) (re.++ (re.union (str.to_re "1") (str.to_re "2")) (re.range "0" "9")) (re.++ (str.to_re "3") (re.union (str.to_re "0") (str.to_re "1")))) (str.to_re "/") (re.union (re.++ (re.opt (str.to_re "0")) (re.range "1" "9")) (re.++ (str.to_re "1") (re.range "0" "2")))))))
; &\#x0*(0|1|2|3|4|5|6|7|8|B|C|E|F|10|11|12|13|14|15|16|17|18|19|1A|1B|1C|1D|1E|1F);
(assert (not (str.in_re X (re.++ (str.to_re "&#x") (re.* (str.to_re "0")) (re.union (str.to_re "0") (str.to_re "1") (str.to_re "2") (str.to_re "3") (str.to_re "4") (str.to_re "5") (str.to_re "6") (str.to_re "7") (str.to_re "8") (str.to_re "B") (str.to_re "C") (str.to_re "E") (str.to_re "F") (str.to_re "10") (str.to_re "11") (str.to_re "12") (str.to_re "13") (str.to_re "14") (str.to_re "15") (str.to_re "16") (str.to_re "17") (str.to_re "18") (str.to_re "19") (str.to_re "1A") (str.to_re "1B") (str.to_re "1C") (str.to_re "1D") (str.to_re "1E") (str.to_re "1F")) (str.to_re ";\u{a}")))))
(check-sat)
