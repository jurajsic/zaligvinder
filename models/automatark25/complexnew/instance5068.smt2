(declare-const X String)
; \\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}
(assert (not (str.in_re X (re.++ (str.to_re "\u{5c}") ((_ re.loop 1 3) (str.to_re "d")) (str.to_re "\u{5c}") re.allchar (str.to_re "\u{5c}") ((_ re.loop 1 3) (str.to_re "d")) (str.to_re "\u{5c}") re.allchar (str.to_re "\u{5c}") ((_ re.loop 1 3) (str.to_re "d")) (str.to_re "\u{5c}") re.allchar (str.to_re "\u{5c}") ((_ re.loop 1 3) (str.to_re "d")) (str.to_re "\u{a}")))))
; ^.*(([^\.][\.][wW][mM][aA])|([^\.][\.][mM][pP][3]))$
(assert (str.in_re X (re.++ (re.* re.allchar) (re.union (re.++ (re.comp (str.to_re ".")) (str.to_re ".") (re.union (str.to_re "w") (str.to_re "W")) (re.union (str.to_re "m") (str.to_re "M")) (re.union (str.to_re "a") (str.to_re "A"))) (re.++ (re.comp (str.to_re ".")) (str.to_re ".") (re.union (str.to_re "m") (str.to_re "M")) (re.union (str.to_re "p") (str.to_re "P")) (str.to_re "3"))) (str.to_re "\u{a}"))))
; www\.actualnames\.com\s+toolbar_domain_redirect\s+Contactfrom=GhostVoiceServer
(assert (not (str.in_re X (re.++ (str.to_re "www.actualnames.com") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "toolbar_domain_redirect") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Contactfrom=GhostVoiceServer\u{a}")))))
(check-sat)
