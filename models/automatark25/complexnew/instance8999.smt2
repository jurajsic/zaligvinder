(set-logic QF_SLIA)
(declare-const X String)
; \.cfg\u{2F}searchfast\u{2F}\u{22}007A-SpyWebsitehttp\u{3A}\u{2F}\u{2F}supremetoolbar\.com\u{2F}index\.php\?tpid=
(assert (str.in_re X (str.to_re ".cfg/searchfast/\u{22}007A-SpyWebsitehttp://supremetoolbar.com/index.php?tpid=\u{a}")))
; /(00356)?(99|79|77|21|27|22|25)[0-9]{6}/g
(assert (not (str.in_re X (re.++ (str.to_re "/") (re.opt (str.to_re "00356")) (re.union (str.to_re "99") (str.to_re "79") (str.to_re "77") (str.to_re "21") (str.to_re "27") (str.to_re "22") (str.to_re "25")) ((_ re.loop 6 6) (re.range "0" "9")) (str.to_re "/g\u{a}")))))
; (([a-zA-Z0-9\-]*\.{1,}){1,}[a-zA-Z0-9]*)
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") (re.+ (re.++ (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "-"))) (re.+ (str.to_re ".")))) (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9")))))))
; User-Agent\u{3A}\s+\u{7D}\u{7B}Password\u{3A}Anal
(assert (not (str.in_re X (re.++ (str.to_re "User-Agent:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "}{Password:\u{1b}Anal\u{a}")))))
; ([0-9a-z_-]+[\.][0-9a-z_-]{1,3})$
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") (re.+ (re.union (re.range "0" "9") (re.range "a" "z") (str.to_re "_") (str.to_re "-"))) (str.to_re ".") ((_ re.loop 1 3) (re.union (re.range "0" "9") (re.range "a" "z") (str.to_re "_") (str.to_re "-")))))))
(check-sat)
