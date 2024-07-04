(set-logic QF_SLIA)
(declare-const X String)
; (("|')[a-z0-9\/\.\?\=\&]*(\.htm|\.asp|\.php|\.jsp)[a-z0-9\/\.\?\=\&]*("|'))|(href=*?[a-z0-9\/\.\?\=\&"']*)
(assert (not (str.in_re X (re.union (re.++ (re.union (str.to_re "\u{22}") (str.to_re "'")) (re.* (re.union (re.range "a" "z") (re.range "0" "9") (str.to_re "/") (str.to_re ".") (str.to_re "?") (str.to_re "=") (str.to_re "&"))) (re.* (re.union (re.range "a" "z") (re.range "0" "9") (str.to_re "/") (str.to_re ".") (str.to_re "?") (str.to_re "=") (str.to_re "&"))) (re.union (str.to_re "\u{22}") (str.to_re "'")) (str.to_re ".") (re.union (str.to_re "htm") (str.to_re "asp") (str.to_re "php") (str.to_re "jsp"))) (re.++ (str.to_re "\u{a}href") (re.* (str.to_re "=")) (re.* (re.union (re.range "a" "z") (re.range "0" "9") (str.to_re "/") (str.to_re ".") (str.to_re "?") (str.to_re "=") (str.to_re "&") (str.to_re "\u{22}") (str.to_re "'"))))))))
; \d{10,12}@[a-zA-Z].[a-zA-Z].*
(assert (not (str.in_re X (re.++ ((_ re.loop 10 12) (re.range "0" "9")) (str.to_re "@") (re.union (re.range "a" "z") (re.range "A" "Z")) re.allchar (re.union (re.range "a" "z") (re.range "A" "Z")) (re.* re.allchar) (str.to_re "\u{a}")))))
; action\u{2E}IP-FTPsearch\.dropspam\.com
(assert (str.in_re X (str.to_re "action.IP-FTPsearch.dropspam.com\u{a}")))
; fhfksjzsfu\u{2f}ahm\.uqs\s+Host\u{3a}\swww\.fast-finder\.com\sStarted\!$3
(assert (str.in_re X (re.++ (str.to_re "fhfksjzsfu/ahm.uqs") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Host:") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "www.fast-finder.com") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "Started!3\u{a}"))))
; ^[0-9]{1,15}(\.([0-9]{1,2}))?$
(assert (not (str.in_re X (re.++ ((_ re.loop 1 15) (re.range "0" "9")) (re.opt (re.++ (str.to_re ".") ((_ re.loop 1 2) (re.range "0" "9")))) (str.to_re "\u{a}")))))
(check-sat)
