(declare-const X String)
; [a-z0-9][a-z0-9_\.-]{0,}[a-z0-9]\.[a-z0-9][a-z0-9_\.-]{0,}[a-z0-9][\.][cn]{2,4}
(assert (not (str.in_re X (re.++ (re.union (re.range "a" "z") (re.range "0" "9")) (re.* (re.union (re.range "a" "z") (re.range "0" "9") (str.to_re "_") (str.to_re ".") (str.to_re "-"))) (re.union (re.range "a" "z") (re.range "0" "9")) (str.to_re ".") (re.union (re.range "a" "z") (re.range "0" "9")) (re.* (re.union (re.range "a" "z") (re.range "0" "9") (str.to_re "_") (str.to_re ".") (str.to_re "-"))) (re.union (re.range "a" "z") (re.range "0" "9")) (str.to_re ".") ((_ re.loop 2 4) (re.union (str.to_re "c") (str.to_re "n"))) (str.to_re "\u{a}")))))
(check-sat)
