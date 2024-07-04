(set-logic QF_SLIA)
(declare-const X String)
; ^([+]39)?((38[{8,9}|0])|(34[{7-9}|0])|(36[6|8|0])|(33[{3-9}|0])|(32[{8,9}]))([\d]{7})$
(assert (not (str.in_re X (re.++ (re.opt (str.to_re "+39")) (re.union (re.++ (str.to_re "38") (re.union (str.to_re "{") (str.to_re "8") (str.to_re ",") (str.to_re "9") (str.to_re "}") (str.to_re "|") (str.to_re "0"))) (re.++ (str.to_re "34") (re.union (str.to_re "{") (re.range "7" "9") (str.to_re "}") (str.to_re "|") (str.to_re "0"))) (re.++ (str.to_re "36") (re.union (str.to_re "6") (str.to_re "|") (str.to_re "8") (str.to_re "0"))) (re.++ (str.to_re "33") (re.union (str.to_re "{") (re.range "3" "9") (str.to_re "}") (str.to_re "|") (str.to_re "0"))) (re.++ (str.to_re "32") (re.union (str.to_re "{") (str.to_re "8") (str.to_re ",") (str.to_re "9") (str.to_re "}")))) ((_ re.loop 7 7) (re.range "0" "9")) (str.to_re "\u{a}")))))
; \u{2E}html.*cm.*www\u{2E}peer2mail\u{2E}comConnectedStubbyawbeta\.net-nucleus\.com
(assert (str.in_re X (re.++ (str.to_re ".html") (re.* re.allchar) (str.to_re "cm") (re.* re.allchar) (str.to_re "www.peer2mail.comConnectedStubbyawbeta.net-nucleus.com\u{a}"))))
; vb\s+Host\u{3A}Subject\u{3A}online-casino-searcher\.com
(assert (str.in_re X (re.++ (str.to_re "vb") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Host:Subject:online-casino-searcher.com\u{a}"))))
; url\(['"]?([\w\d_\-\. ]+)['"]?\)
(assert (str.in_re X (re.++ (str.to_re "url(") (re.opt (re.union (str.to_re "'") (str.to_re "\u{22}"))) (re.+ (re.union (re.range "0" "9") (str.to_re "_") (str.to_re "-") (str.to_re ".") (str.to_re " ") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (re.opt (re.union (str.to_re "'") (str.to_re "\u{22}"))) (str.to_re ")\u{a}"))))
(check-sat)
