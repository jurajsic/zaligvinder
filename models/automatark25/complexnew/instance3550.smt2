(declare-const X String)
; ^([\s\S]){1,20}([\s\.])
(assert (not (str.in_re X (re.++ ((_ re.loop 1 20) (re.union (re.comp (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.union (str.to_re ".") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "\u{a}")))))
; ^\({0,1}((0|\+61)(2|4|3|7|8)){0,1}\){0,1}(\ |-){0,1}[0-9]{2}(\ |-){0,1}[0-9]{2}(\ |-){0,1}[0-9]{1}(\ |-){0,1}[0-9]{3}$
(assert (not (str.in_re X (re.++ (re.opt (str.to_re "(")) (re.opt (re.++ (re.union (str.to_re "0") (str.to_re "+61")) (re.union (str.to_re "2") (str.to_re "4") (str.to_re "3") (str.to_re "7") (str.to_re "8")))) (re.opt (str.to_re ")")) (re.opt (re.union (str.to_re " ") (str.to_re "-"))) ((_ re.loop 2 2) (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "-"))) ((_ re.loop 2 2) (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "-"))) ((_ re.loop 1 1) (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "-"))) ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "\u{a}")))))
; ^(^[0-9]*(^[0-9]*[\.][0-9]+){0,1}$)
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") (re.* (re.range "0" "9")) (re.opt (re.++ (re.* (re.range "0" "9")) (str.to_re ".") (re.+ (re.range "0" "9"))))))))
(check-sat)
