(set-logic QF_SLIA)
(declare-const X String)
; www\u{2E}eblocs\u{2E}comcorep\u{2E}dmcast\u{2E}com
(assert (str.in_re X (str.to_re "www.eblocs.com\u{1b}corep.dmcast.com\u{a}")))
; www\u{2E}purityscan\u{2E}com\s+from\.myway\.comToolbarUI2
(assert (not (str.in_re X (re.++ (str.to_re "www.purityscan.com") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "from.myway.com\u{1b}ToolbarUI2\u{a}")))))
(check-sat)
