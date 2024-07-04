(set-logic QF_SLIA)
(declare-const X String)
; 05\d{8}
(assert (not (str.in_re X (re.++ (str.to_re "05") ((_ re.loop 8 8) (re.range "0" "9")) (str.to_re "\u{a}")))))
; http[s]?://(www.facebook|[a-zA-Z]{2}-[a-zA-Z]{2}.facebook|facebook)\.com/(pages/[a-zA-Z0-9\.-]+/[0-9]+|[a-zA-Z0-9\.-]+)[/]?$
(assert (str.in_re X (re.++ (str.to_re "http") (re.opt (str.to_re "s")) (str.to_re "://") (re.union (re.++ (str.to_re "www") re.allchar (str.to_re "facebook")) (re.++ ((_ re.loop 2 2) (re.union (re.range "a" "z") (re.range "A" "Z"))) (str.to_re "-") ((_ re.loop 2 2) (re.union (re.range "a" "z") (re.range "A" "Z"))) re.allchar (str.to_re "facebook")) (str.to_re "facebook")) (str.to_re ".com/") (re.union (re.++ (str.to_re "pages/") (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re ".") (str.to_re "-"))) (str.to_re "/") (re.+ (re.range "0" "9"))) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re ".") (str.to_re "-")))) (re.opt (str.to_re "/")) (str.to_re "\u{a}"))))
; /\u{2e}xlsx([\?\u{5c}\u{2f}]|$)/smiU
(assert (not (str.in_re X (re.++ (str.to_re "/.xlsx") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}")))))
; Port\u{2E}[^\n\r]*007\d+Logsdl\u{2E}web-nexus\u{2E}net
(assert (not (str.in_re X (re.++ (str.to_re "Port.") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "007") (re.+ (re.range "0" "9")) (str.to_re "Logsdl.web-nexus.net\u{a}")))))
(check-sat)
