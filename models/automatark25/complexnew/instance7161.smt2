(set-logic QF_SLIA)
(declare-const X String)
; IP-[^\n\r]*URL\d\u{7c}roogoo\u{7c}\.cfgmPOPrtCUSTOMPalToolbar
(assert (not (str.in_re X (re.++ (str.to_re "IP-") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "URL") (re.range "0" "9") (str.to_re "|roogoo|.cfgmPOPrtCUSTOMPalToolbar\u{a}")))))
; User-Agent\u{3A}\d+wjpropqmlpohj\u{2f}lo\s+media\u{2E}dxcdirect\u{2E}com
(assert (not (str.in_re X (re.++ (str.to_re "User-Agent:") (re.+ (re.range "0" "9")) (str.to_re "wjpropqmlpohj/lo") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "media.dxcdirect.com\u{a}")))))
(check-sat)
