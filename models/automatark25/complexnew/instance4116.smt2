(set-logic QF_SLIA)
(declare-const X String)
; /\u{2e}mp3([\?\u{5c}\u{2f}]|$)/smiU
(assert (str.in_re X (re.++ (str.to_re "/.mp3") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}"))))
; ^((0?[1-9]|1[012])(:[0-5]\d){0,2}(\ [AP]M))$|^([01]\d|2[0-3])(:[0-5]\d){0,2}$
(assert (not (str.in_re X (re.union (re.++ (re.union (re.++ (re.opt (str.to_re "0")) (re.range "1" "9")) (re.++ (str.to_re "1") (re.union (str.to_re "0") (str.to_re "1") (str.to_re "2")))) ((_ re.loop 0 2) (re.++ (str.to_re ":") (re.range "0" "5") (re.range "0" "9"))) (str.to_re " ") (re.union (str.to_re "A") (str.to_re "P")) (str.to_re "M")) (re.++ (re.union (re.++ (re.union (str.to_re "0") (str.to_re "1")) (re.range "0" "9")) (re.++ (str.to_re "2") (re.range "0" "3"))) ((_ re.loop 0 2) (re.++ (str.to_re ":") (re.range "0" "5") (re.range "0" "9"))) (str.to_re "\u{a}"))))))
; /filename=[^\n]*\u{2e}asf/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".asf/i\u{a}")))))
; RXFilteredDmInf\u{5E}JMailYeah\!Online\u{25}21\u{25}21\u{25}21Reportsversion\u{2E}txt
(assert (not (str.in_re X (str.to_re "RXFilteredDmInf^JMailYeah!Online%21%21%21Reportsversion.txt\u{a}"))))
(check-sat)
