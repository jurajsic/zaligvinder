(set-logic QF_SLIA)
(declare-const X String)
; ^[a-zA-Z]{1}[-][0-9]{7}[-][a-zA-Z]{1}$
(assert (not (str.in_re X (re.++ ((_ re.loop 1 1) (re.union (re.range "a" "z") (re.range "A" "Z"))) (str.to_re "-") ((_ re.loop 7 7) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 1 1) (re.union (re.range "a" "z") (re.range "A" "Z"))) (str.to_re "\u{a}")))))
; URLUBAgent%3fSchwindlerurl=Host\u{3a}httpUser-Agent\u{3A}
(assert (not (str.in_re X (str.to_re "URLUBAgent%3fSchwindlerurl=Host:httpUser-Agent:\u{a}"))))
; /\.php\?mac\u{3d}([a-f0-9]{2}\u{3a}){5}[a-f0-9]{2}$/U
(assert (not (str.in_re X (re.++ (str.to_re "/.php?mac=") ((_ re.loop 5 5) (re.++ ((_ re.loop 2 2) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re ":"))) ((_ re.loop 2 2) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "/U\u{a}")))))
; /filename=[^\n]*\u{2e}xslt/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".xslt/i\u{a}"))))
; DownloadDmInf\u{5E}infoSimpsonUser-Agent\u{3A}Client
(assert (not (str.in_re X (str.to_re "DownloadDmInf^infoSimpsonUser-Agent:Client\u{a}"))))
(check-sat)
