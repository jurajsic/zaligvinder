(set-logic QF_SLIA)
(declare-const X String)
; ^\w+.*$
(assert (not (str.in_re X (re.++ (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (re.* re.allchar) (str.to_re "\u{a}")))))
; ^([\+][0-9]{1,3}([ \.\-])?)?([\(]{1}[0-9]{3}[\)])?([0-9A-Z \.\-]{1,32})((x|ext|extension)?[0-9]{1,4}?)$
(assert (str.in_re X (re.++ (re.opt (re.++ (str.to_re "+") ((_ re.loop 1 3) (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re ".") (str.to_re "-"))))) (re.opt (re.++ ((_ re.loop 1 1) (str.to_re "(")) ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re ")"))) ((_ re.loop 1 32) (re.union (re.range "0" "9") (re.range "A" "Z") (str.to_re " ") (str.to_re ".") (str.to_re "-"))) (str.to_re "\u{a}") (re.opt (re.union (str.to_re "x") (str.to_re "ext") (str.to_re "extension"))) ((_ re.loop 1 4) (re.range "0" "9")))))
; ^([a-zA-Z][a-zA-Z0-9]{1,100})$
(assert (str.in_re X (re.++ (str.to_re "\u{a}") (re.union (re.range "a" "z") (re.range "A" "Z")) ((_ re.loop 1 100) (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9"))))))
; ProjectHost\u{3A}logHost\u{3A}www\u{2E}snap\u{2E}comGoogle-\>rtServidor\u{2E}
(assert (not (str.in_re X (str.to_re "ProjectHost:logHost:www.snap.comGoogle->rtServidor.\u{13}\u{a}"))))
; ver\d+sports\w+whenu\u{2E}comwp-includes\u{2F}feed\u{2E}php\u{3F}
(assert (str.in_re X (re.++ (str.to_re "ver") (re.+ (re.range "0" "9")) (str.to_re "sports") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "whenu.com\u{13}wp-includes/feed.php?\u{a}"))))
(check-sat)
