(set-logic QF_SLIA)
(declare-const X String)
; www\u{2E}alfacleaner\u{2E}comHost\u{3a}Logs
(assert (str.in_re X (str.to_re "www.alfacleaner.comHost:Logs\u{a}")))
; Port\u{2E}[^\n\r]*007\d+Logsdl\u{2E}web-nexus\u{2E}net
(assert (str.in_re X (re.++ (str.to_re "Port.") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "007") (re.+ (re.range "0" "9")) (str.to_re "Logsdl.web-nexus.net\u{a}"))))
; (Mo(n(day)?)?|Tu(e(sday)?)?|We(d(nesday)?)?|Th(u(rsday)?)?|Fr(i(day)?)?|Sa(t(urday)?)?|Su(n(day)?)?)
(assert (not (str.in_re X (re.++ (re.union (re.++ (str.to_re "Mo") (re.opt (re.++ (str.to_re "n") (re.opt (str.to_re "day"))))) (re.++ (str.to_re "Tu") (re.opt (re.++ (str.to_re "e") (re.opt (str.to_re "sday"))))) (re.++ (str.to_re "We") (re.opt (re.++ (str.to_re "d") (re.opt (str.to_re "nesday"))))) (re.++ (str.to_re "Th") (re.opt (re.++ (str.to_re "u") (re.opt (str.to_re "rsday"))))) (re.++ (str.to_re "Fr") (re.opt (re.++ (str.to_re "i") (re.opt (str.to_re "day"))))) (re.++ (str.to_re "Sa") (re.opt (re.++ (str.to_re "t") (re.opt (str.to_re "urday"))))) (re.++ (str.to_re "Su") (re.opt (re.++ (str.to_re "n") (re.opt (str.to_re "day")))))) (str.to_re "\u{a}")))))
; /filename=[^\n]*\u{2e}nab/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".nab/i\u{a}")))))
; \w{5,255}
(assert (str.in_re X (re.++ ((_ re.loop 5 255) (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "\u{a}"))))
(check-sat)
