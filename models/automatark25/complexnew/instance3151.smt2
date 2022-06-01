(declare-const X String)
; ^[-+]?\d+(\.\d+)?|[-+]?\.\d+?$
(assert (str.in_re X (re.union (re.++ (re.opt (re.union (str.to_re "-") (str.to_re "+"))) (re.+ (re.range "0" "9")) (re.opt (re.++ (str.to_re ".") (re.+ (re.range "0" "9"))))) (re.++ (re.opt (re.union (str.to_re "-") (str.to_re "+"))) (str.to_re ".") (re.+ (re.range "0" "9")) (str.to_re "\u{a}")))))
; corep\u{2E}dmcast\u{2E}comOwner\u{3A}
(assert (str.in_re X (str.to_re "corep.dmcast.comOwner:\u{a}")))
; <[ \t]*[iI][mM][gG][ \t]*[sS][rR][cC][ \t]*=[ \t]*['\"]([^'\"]+)
(assert (not (str.in_re X (re.++ (str.to_re "<") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}"))) (re.union (str.to_re "i") (str.to_re "I")) (re.union (str.to_re "m") (str.to_re "M")) (re.union (str.to_re "g") (str.to_re "G")) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}"))) (re.union (str.to_re "s") (str.to_re "S")) (re.union (str.to_re "r") (str.to_re "R")) (re.union (str.to_re "c") (str.to_re "C")) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}"))) (str.to_re "=") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}"))) (re.union (str.to_re "'") (str.to_re "\u{22}")) (re.+ (re.union (str.to_re "'") (str.to_re "\u{22}"))) (str.to_re "\u{a}")))))
; www\u{2E}alfacleaner\u{2E}comHost\u{3a}Logs
(assert (not (str.in_re X (str.to_re "www.alfacleaner.comHost:Logs\u{a}"))))
; ^([(][1-9]{2}[)] )?[0-9]{4}[-]?[0-9]{4}$
(assert (str.in_re X (re.++ (re.opt (re.++ (str.to_re "(") ((_ re.loop 2 2) (re.range "1" "9")) (str.to_re ") "))) ((_ re.loop 4 4) (re.range "0" "9")) (re.opt (str.to_re "-")) ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}"))))
(check-sat)
