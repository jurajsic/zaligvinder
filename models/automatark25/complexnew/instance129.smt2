(declare-const X String)
; ^([a-zA-Z]+[\'\,\.\-]?[a-zA-Z ]*)+[ ]([a-zA-Z]+[\'\,\.\-]?[a-zA-Z ]+)+$
(assert (str.in_re X (re.++ (re.+ (re.++ (re.+ (re.union (re.range "a" "z") (re.range "A" "Z"))) (re.opt (re.union (str.to_re "'") (str.to_re ",") (str.to_re ".") (str.to_re "-"))) (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (str.to_re " "))))) (str.to_re " ") (re.+ (re.++ (re.+ (re.union (re.range "a" "z") (re.range "A" "Z"))) (re.opt (re.union (str.to_re "'") (str.to_re ",") (str.to_re ".") (str.to_re "-"))) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (str.to_re " "))))) (str.to_re "\u{a}"))))
; wp-includes\u{2F}theme\u{2E}php\u{3F}.*Apofis\s+TencentTraveler
(assert (str.in_re X (re.++ (str.to_re "wp-includes/theme.php?") (re.* re.allchar) (str.to_re "Apofis") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "TencentTraveler\u{a}"))))
; (CY-?)?[0-9]{8}[A-Z]
(assert (str.in_re X (re.++ (re.opt (re.++ (str.to_re "CY") (re.opt (str.to_re "-")))) ((_ re.loop 8 8) (re.range "0" "9")) (re.range "A" "Z") (str.to_re "\u{a}"))))
; ^01[0-2]{1}[0-9]{8}
(assert (not (str.in_re X (re.++ (str.to_re "01") ((_ re.loop 1 1) (re.range "0" "2")) ((_ re.loop 8 8) (re.range "0" "9")) (str.to_re "\u{a}")))))
(check-sat)
