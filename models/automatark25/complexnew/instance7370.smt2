(set-logic QF_SLIA)
(declare-const X String)
; dl\u{2E}web-nexus\u{2E}net\d+www\u{2E}onlinecasinoextra\u{2E}comsqlads\.grokads\.com
(assert (str.in_re X (re.++ (str.to_re "dl.web-nexus.net") (re.+ (re.range "0" "9")) (str.to_re "www.onlinecasinoextra.comsqlads.grokads.com\u{a}"))))
; /\u{2e}class([\?\u{5c}\u{2f}]|$)/smiU
(assert (not (str.in_re X (re.++ (str.to_re "/.class") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}")))))
(check-sat)
