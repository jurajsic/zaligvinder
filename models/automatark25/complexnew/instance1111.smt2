(set-logic QF_SLIA)
(declare-const X String)
; ^(\+971[\s]{0,1}[\-]{0,1}[\s]{0,1}|[\s]{0,1}0)(5[056]{1})[\s]{0,1}[\-]{0,1}[\s]{0,1}[1-9]{1}[0-9]{6}$
(assert (str.in_re X (re.++ (re.union (re.++ (str.to_re "+971") (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.opt (str.to_re "-")) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")))) (re.++ (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "0"))) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.opt (str.to_re "-")) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 1 1) (re.range "1" "9")) ((_ re.loop 6 6) (re.range "0" "9")) (str.to_re "\u{a}5") ((_ re.loop 1 1) (re.union (str.to_re "0") (str.to_re "5") (str.to_re "6"))))))
; corep\u{2E}dmcast\u{2E}com[^\n\r]*Referer\u{3a}.*is[^\n\r]*KeyloggerExplorerfileserverSI\|Server\|www\u{2E}myarmory\u{2E}com
(assert (not (str.in_re X (re.++ (str.to_re "corep.dmcast.com") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "Referer:") (re.* re.allchar) (str.to_re "is") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "KeyloggerExplorerfileserverSI|Server|\u{13}www.myarmory.com\u{a}")))))
; /\/3001[0-9A-F]{262,304}/
(assert (not (str.in_re X (re.++ (str.to_re "//3001") ((_ re.loop 262 304) (re.union (re.range "0" "9") (re.range "A" "F"))) (str.to_re "/\u{a}")))))
(check-sat)
