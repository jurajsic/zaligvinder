(set-logic QF_SLIA)
(declare-const X String)
; MicrosoftHost\u{3A}Subject\u{3a}namedDownloadUser-Agent\u{3a}
(assert (not (str.in_re X (str.to_re "MicrosoftHost:Subject:namedDownloadUser-Agent:\u{a}"))))
; /filename=[^\n]*\u{2e}xspf/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".xspf/i\u{a}"))))
; ^(http\://){1}(((www\.){1}([a-zA-Z0-9\-]*\.){1,}){1}|([a-zA-Z0-9\-]*\.){1,10}){1}([a-zA-Z]{2,6}\.){1}([a-zA-Z0-9\-\._\?\,\'/\\\+&%\$#\=~])*
(assert (not (str.in_re X (re.++ ((_ re.loop 1 1) (str.to_re "http://")) ((_ re.loop 1 1) (re.union ((_ re.loop 1 1) (re.++ ((_ re.loop 1 1) (str.to_re "www.")) (re.+ (re.++ (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "-"))) (str.to_re "."))))) ((_ re.loop 1 10) (re.++ (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "-"))) (str.to_re "."))))) ((_ re.loop 1 1) (re.++ ((_ re.loop 2 6) (re.union (re.range "a" "z") (re.range "A" "Z"))) (str.to_re "."))) (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "-") (str.to_re ".") (str.to_re "_") (str.to_re "?") (str.to_re ",") (str.to_re "'") (str.to_re "/") (str.to_re "\u{5c}") (str.to_re "+") (str.to_re "&") (str.to_re "%") (str.to_re "$") (str.to_re "#") (str.to_re "=") (str.to_re "~"))) (str.to_re "\u{a}")))))
(check-sat)
