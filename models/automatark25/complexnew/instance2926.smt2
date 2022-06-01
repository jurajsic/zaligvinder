(declare-const X String)
; %3f\s+url=[^\n\r]*httpUser-Agent\u{3A}
(assert (str.in_re X (re.++ (str.to_re "%3f") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "url=") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "httpUser-Agent:\u{a}"))))
; ^\([0-9]{3}\)[0-9]{3}(-)[0-9]{4}
(assert (str.in_re X (re.++ (str.to_re "(") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re ")") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}"))))
; SystemSleuth1\u{2E}0versionHost\u{3A}ArrowHost\u{3a}3Awebsearch\u{2E}drsnsrch\u{2E}comhostieiWonHost\u{3a}pjpoptwql\u{2f}rlnj
(assert (not (str.in_re X (str.to_re "SystemSleuth\u{13}1.0versionHost:ArrowHost:3Awebsearch.drsnsrch.com\u{13}hostieiWonHost:pjpoptwql/rlnj\u{a}"))))
; url=http\u{3A}\s+jsp[^\n\r]*serverHOST\u{3A}Subject\u{3A}i\-femdom\u{2E}com
(assert (not (str.in_re X (re.++ (str.to_re "url=http:\u{1b}") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "jsp") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "serverHOST:Subject:i-femdom.com\u{a}")))))
(check-sat)
