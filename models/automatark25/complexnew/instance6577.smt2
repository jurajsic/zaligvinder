(set-logic QF_SLIA)
(declare-const X String)
; Monitor\s+SupervisorPalUser-Agent\u{3A}
(assert (str.in_re X (re.++ (str.to_re "Monitor") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "SupervisorPalUser-Agent:\u{a}"))))
; ^(/w|/W|[^<>+?$%{}&])+$
(assert (not (str.in_re X (re.++ (re.+ (re.union (str.to_re "/w") (str.to_re "/W") (str.to_re "<") (str.to_re ">") (str.to_re "+") (str.to_re "?") (str.to_re "$") (str.to_re "%") (str.to_re "{") (str.to_re "}") (str.to_re "&"))) (str.to_re "\u{a}")))))
; for.*www\u{2E}eblocs\u{2E}com\d\u{2F}iis2ebs\.asp\d\<title\>Actual\u{2F}pagead\u{2F}ads\?search2\.ad\.shopnav\.com\u{2F}9899\u{2F}search\u{2F}results\.php
(assert (not (str.in_re X (re.++ (str.to_re "for") (re.* re.allchar) (str.to_re "www.eblocs.com\u{1b}") (re.range "0" "9") (str.to_re "/iis2ebs.asp") (re.range "0" "9") (str.to_re "<title>Actual/pagead/ads?search2.ad.shopnav.com/9899/search/results.php\u{a}")))))
(check-sat)
