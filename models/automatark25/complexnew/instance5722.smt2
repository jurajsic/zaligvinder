(set-logic QF_SLIA)
(declare-const X String)
; /^\/[a-f0-9]{32}\/[a-z]{1,15}-[a-z]{1,15}\.php/U
(assert (not (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 32 32) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "/") ((_ re.loop 1 15) (re.range "a" "z")) (str.to_re "-") ((_ re.loop 1 15) (re.range "a" "z")) (str.to_re ".php/U\u{a}")))))
; User-Agent\u{3a}Host\u{3A}Host\u{3A}SpyBuddy
(assert (str.in_re X (str.to_re "User-Agent:Host:Host:SpyBuddy\u{a}")))
(check-sat)
