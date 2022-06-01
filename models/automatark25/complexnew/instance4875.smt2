(declare-const X String)
; /\u{2e}lzh([\?\u{5c}\u{2f}]|$)/smiU
(assert (str.in_re X (re.++ (str.to_re "/.lzh") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}"))))
; ^(102[0-3]|10[0-1]\d|[1-9][0-9]{0,2}|0)$
(assert (str.in_re X (re.++ (re.union (re.++ (str.to_re "102") (re.range "0" "3")) (re.++ (str.to_re "10") (re.range "0" "1") (re.range "0" "9")) (re.++ (re.range "1" "9") ((_ re.loop 0 2) (re.range "0" "9"))) (str.to_re "0")) (str.to_re "\u{a}"))))
; /filename=[^\n]*\u{2e}wma/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".wma/i\u{a}"))))
; <!--.*?-->
(assert (str.in_re X (re.++ (str.to_re "<!--") (re.* re.allchar) (str.to_re "-->\u{a}"))))
; frame_ver2\s+www\u{2e}urlblaze\u{2e}net\s+source\=IncrediFind\s+AgentHost\u{3A}Host\u{3A}Host\u{3A}\u{2F}GRSpynova3AFrom\u{3A}
(assert (not (str.in_re X (re.++ (str.to_re "frame_ver2") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "www.urlblaze.net") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "source=IncrediFind") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "AgentHost:Host:Host:/GRSpynova3AFrom:\u{a}")))))
(check-sat)
