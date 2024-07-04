(set-logic QF_SLIA)
(declare-const X String)
; /\/14\d{8}(.jar)?$/U
(assert (not (str.in_re X (re.++ (str.to_re "//14") ((_ re.loop 8 8) (re.range "0" "9")) (re.opt (re.++ re.allchar (str.to_re "jar"))) (str.to_re "/U\u{a}")))))
; 9[0-9]
(assert (not (str.in_re X (re.++ (str.to_re "9") (re.range "0" "9") (str.to_re "\u{a}")))))
; Host\u{3A}[^\n\r]*Travel[^\n\r]*From\u{3A}www\u{2E}ZSearchResults\u{2E}com
(assert (str.in_re X (re.++ (str.to_re "Host:") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "Travel") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "From:www.ZSearchResults.com\u{13}\u{a}"))))
; /\.php\?b=[A-F0-9]+&v=1\./U
(assert (str.in_re X (re.++ (str.to_re "/.php?b=") (re.+ (re.union (re.range "A" "F") (re.range "0" "9"))) (str.to_re "&v=1./U\u{a}"))))
; [^ _0-9a-zA-Z\$\%\'\-\@\{\}\~\!\#\(\)\&\^]
(assert (not (str.in_re X (re.++ (re.union (str.to_re " ") (str.to_re "_") (re.range "0" "9") (re.range "a" "z") (re.range "A" "Z") (str.to_re "$") (str.to_re "%") (str.to_re "'") (str.to_re "-") (str.to_re "@") (str.to_re "{") (str.to_re "}") (str.to_re "~") (str.to_re "!") (str.to_re "#") (str.to_re "(") (str.to_re ")") (str.to_re "&") (str.to_re "^")) (str.to_re "\u{a}")))))
(check-sat)
