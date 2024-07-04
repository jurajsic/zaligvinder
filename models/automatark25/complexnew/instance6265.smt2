(set-logic QF_SLIA)
(declare-const X String)
; (".+"\s)?<?[a-z\._0-9]+[^\._]@([a-z0-9]+\.)+[a-z0-9]{2,6}>?;?
(assert (not (str.in_re X (re.++ (re.opt (re.++ (str.to_re "\u{22}") (re.+ re.allchar) (str.to_re "\u{22}") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")))) (re.opt (str.to_re "<")) (re.+ (re.union (re.range "a" "z") (str.to_re ".") (str.to_re "_") (re.range "0" "9"))) (re.union (str.to_re ".") (str.to_re "_")) (str.to_re "@") (re.+ (re.++ (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re "."))) ((_ re.loop 2 6) (re.union (re.range "a" "z") (re.range "0" "9"))) (re.opt (str.to_re ">")) (re.opt (str.to_re ";")) (str.to_re "\u{a}")))))
; (^\*\.[a-zA-Z][a-zA-Z][a-zA-Z]$)|(^\*\.\*$)
(assert (str.in_re X (re.union (re.++ (str.to_re "*.") (re.union (re.range "a" "z") (re.range "A" "Z")) (re.union (re.range "a" "z") (re.range "A" "Z")) (re.union (re.range "a" "z") (re.range "A" "Z"))) (str.to_re "*.*\u{a}"))))
; RequestedLoggedtb\u{2E}freeprod\u{2E}comHWAESubject\u{3a}adserver\.warezclient\.com
(assert (not (str.in_re X (str.to_re "RequestedLoggedtb.freeprod.comHWAESubject:adserver.warezclient.com\u{a}"))))
(check-sat)
