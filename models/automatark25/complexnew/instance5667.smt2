(set-logic QF_SLIA)
(declare-const X String)
; ^(([0-9])|([0-2][0-9])|([3][0-1]))\/(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\/\d{4}$
(assert (not (str.in_re X (re.++ (re.union (re.range "0" "9") (re.++ (re.range "0" "2") (re.range "0" "9")) (re.++ (str.to_re "3") (re.range "0" "1"))) (str.to_re "/") (re.union (str.to_re "Jan") (str.to_re "Feb") (str.to_re "Mar") (str.to_re "Apr") (str.to_re "May") (str.to_re "Jun") (str.to_re "Jul") (str.to_re "Aug") (str.to_re "Sep") (str.to_re "Oct") (str.to_re "Nov") (str.to_re "Dec")) (str.to_re "/") ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}")))))
; /\u{2e}img([\?\u{5c}\u{2f}]|$)/smiU
(assert (not (str.in_re X (re.++ (str.to_re "/.img") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}")))))
; on\w+Host\u{3A}ComputerKeylogger\u{2E}comHost\u{3A}User-Agent\u{3A}
(assert (str.in_re X (re.++ (str.to_re "on") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "Host:ComputerKeylogger.comHost:User-Agent:\u{a}"))))
; Host\u{3A}.*Peer.*Host\u{3A}Basicurl=http\u{3A}
(assert (str.in_re X (re.++ (str.to_re "Host:") (re.* re.allchar) (str.to_re "Peer") (re.* re.allchar) (str.to_re "Host:Basicurl=http:\u{1b}\u{a}"))))
(check-sat)
