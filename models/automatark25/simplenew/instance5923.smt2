(declare-const X String)
; ^([0-5]?\d?\d?\d?\d|6[0-4]\d\d\d|65[0-4]\d\d|655[0-2]\d|6553[0-5])$
(assert (str.in_re X (re.++ (re.union (re.++ (re.opt (re.range "0" "5")) (re.opt (re.range "0" "9")) (re.opt (re.range "0" "9")) (re.opt (re.range "0" "9")) (re.range "0" "9")) (re.++ (str.to_re "6") (re.range "0" "4") (re.range "0" "9") (re.range "0" "9") (re.range "0" "9")) (re.++ (str.to_re "65") (re.range "0" "4") (re.range "0" "9") (re.range "0" "9")) (re.++ (str.to_re "655") (re.range "0" "2") (re.range "0" "9")) (re.++ (str.to_re "6553") (re.range "0" "5"))) (str.to_re "\u{a}"))))
(check-sat)
