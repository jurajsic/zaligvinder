(set-logic QF_SLIA)
(declare-const X String)
; wjpropqmlpohj\u{2f}lo\s+media\u{2E}dxcdirect\u{2E}com
(assert (str.in_re X (re.++ (str.to_re "wjpropqmlpohj/lo") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "media.dxcdirect.com\u{a}"))))
; ^[a-zA-Z]$
(assert (str.in_re X (re.++ (re.union (re.range "a" "z") (re.range "A" "Z")) (str.to_re "\u{a}"))))
; \+353\(0\)\s\d\s\d{3}\s\d{4}
(assert (not (str.in_re X (re.++ (str.to_re "+353(0)") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (re.range "0" "9") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) ((_ re.loop 3 3) (re.range "0" "9")) (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}")))))
; User-Agent\u{3a}\s+Host\u{3A}namediepluginHost\u{3A}X-Mailer\u{3A}
(assert (str.in_re X (re.++ (str.to_re "User-Agent:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Host:namediepluginHost:X-Mailer:\u{13}\u{a}"))))
; Log[^\n\r]*Host\u{3A}\dHOST\u{3A}User-Agent\u{3A}
(assert (str.in_re X (re.++ (str.to_re "Log") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "Host:") (re.range "0" "9") (str.to_re "HOST:User-Agent:\u{a}"))))
(check-sat)
