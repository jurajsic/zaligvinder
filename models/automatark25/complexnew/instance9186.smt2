(set-logic QF_SLIA)
(declare-const X String)
; /\/[a-z0-9]{9}\.jnlp$/U
(assert (not (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 9 9) (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re ".jnlp/U\u{a}")))))
; Subject\u{3A}\swww\u{2E}searchwords\u{2E}com
(assert (not (str.in_re X (re.++ (str.to_re "Subject:") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "www.searchwords.com\u{a}")))))
; ^(http|https|ftp)\://[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(:[a-zA-Z0-9]*)?/?([a-zA-Z0-9\-\._\?\,\'/\\\+&%\$#\=~])*[^\.\,\)\(\s]$
(assert (not (str.in_re X (re.++ (re.union (str.to_re "http") (str.to_re "https") (str.to_re "ftp")) (str.to_re "://") (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "-") (str.to_re "."))) (str.to_re ".") ((_ re.loop 2 3) (re.union (re.range "a" "z") (re.range "A" "Z"))) (re.opt (re.++ (str.to_re ":") (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9"))))) (re.opt (str.to_re "/")) (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "-") (str.to_re ".") (str.to_re "_") (str.to_re "?") (str.to_re ",") (str.to_re "'") (str.to_re "/") (str.to_re "\u{5c}") (str.to_re "+") (str.to_re "&") (str.to_re "%") (str.to_re "$") (str.to_re "#") (str.to_re "=") (str.to_re "~"))) (re.union (str.to_re ".") (str.to_re ",") (str.to_re ")") (str.to_re "(") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "\u{a}")))))
; ^([A-Za-z]{5})([0-9]{4})([A-Za-z]{1})$
(assert (str.in_re X (re.++ ((_ re.loop 5 5) (re.union (re.range "A" "Z") (re.range "a" "z"))) ((_ re.loop 4 4) (re.range "0" "9")) ((_ re.loop 1 1) (re.union (re.range "A" "Z") (re.range "a" "z"))) (str.to_re "\u{a}"))))
; Host\u{3A}\s+Host\s+Host\u{3a}InformationX-OSSproxy\u{3a}as\u{2E}starware\u{2E}com
(assert (not (str.in_re X (re.++ (str.to_re "Host:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Host") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Host:InformationX-OSSproxy:as.starware.com\u{a}")))))
(check-sat)
