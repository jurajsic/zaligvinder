(declare-const X String)
; /[^ -~\r\n]{4}/P
(assert (not (str.in_re X (re.++ (str.to_re "/") ((_ re.loop 4 4) (re.union (re.range " " "~") (str.to_re "\u{d}") (str.to_re "\u{a}"))) (str.to_re "/P\u{a}")))))
; ^(0)$|^([1-9][0-9]*)$
(assert (not (str.in_re X (re.union (str.to_re "0") (re.++ (str.to_re "\u{a}") (re.range "1" "9") (re.* (re.range "0" "9")))))))
; (\/\/)(.+)(\/\/)
(assert (str.in_re X (re.++ (str.to_re "//") (re.+ re.allchar) (str.to_re "//\u{a}"))))
; e2give\.com.*Login\s+adfsgecoiwnf\u{23}\u{23}\u{23}\u{23}User-Agent\u{3A}
(assert (not (str.in_re X (re.++ (str.to_re "e2give.com") (re.* re.allchar) (str.to_re "Login") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "adfsgecoiwnf\u{1b}####User-Agent:\u{a}")))))
(check-sat)
