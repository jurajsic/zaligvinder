(set-logic QF_SLIA)
(declare-const X String)
; ^([0]\d|[1][0-2])\/([0-2]\d|[3][0-1])\/([2][01]|[1][6-9])\d{2}(\s([0-1]\d|[2][0-3])(\:[0-5]\d){1,2})?$
(assert (str.in_re X (re.++ (re.union (re.++ (str.to_re "0") (re.range "0" "9")) (re.++ (str.to_re "1") (re.range "0" "2"))) (str.to_re "/") (re.union (re.++ (re.range "0" "2") (re.range "0" "9")) (re.++ (str.to_re "3") (re.range "0" "1"))) (str.to_re "/") (re.union (re.++ (str.to_re "2") (re.union (str.to_re "0") (str.to_re "1"))) (re.++ (str.to_re "1") (re.range "6" "9"))) ((_ re.loop 2 2) (re.range "0" "9")) (re.opt (re.++ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (re.union (re.++ (re.range "0" "1") (re.range "0" "9")) (re.++ (str.to_re "2") (re.range "0" "3"))) ((_ re.loop 1 2) (re.++ (str.to_re ":") (re.range "0" "5") (re.range "0" "9"))))) (str.to_re "\u{a}"))))
; Host\u{3A}.*Hello\u{2E}.*Referer\u{3A}ToolbarCurrent\u{3B}CIA
(assert (str.in_re X (re.++ (str.to_re "Host:") (re.* re.allchar) (str.to_re "Hello.") (re.* re.allchar) (str.to_re "Referer:ToolbarCurrent;CIA\u{a}"))))
; /filename=[^\n]*\u{2e}cpe/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".cpe/i\u{a}")))))
(check-sat)
