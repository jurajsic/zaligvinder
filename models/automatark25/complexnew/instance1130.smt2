(set-logic QF_SLIA)
(declare-const X String)
; ^((\(\d{3}\) ?)|(\d{3}-)|(\(\d{2}\) ?)|(\d{2}-)|(\(\d{1}\) ?)|(\d{1}-))?\d{3}-(\d{3}|\d{4})
(assert (not (str.in_re X (re.++ (re.opt (re.union (re.++ (str.to_re "(") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re ")") (re.opt (str.to_re " "))) (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "-")) (re.++ (str.to_re "(") ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re ")") (re.opt (str.to_re " "))) (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "-")) (re.++ (str.to_re "(") ((_ re.loop 1 1) (re.range "0" "9")) (str.to_re ")") (re.opt (str.to_re " "))) (re.++ ((_ re.loop 1 1) (re.range "0" "9")) (str.to_re "-")))) ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "-") (re.union ((_ re.loop 3 3) (re.range "0" "9")) ((_ re.loop 4 4) (re.range "0" "9"))) (str.to_re "\u{a}")))))
; /\/DES\d{9}O\d{4,5}\u{2e}jsp/Ui
(assert (str.in_re X (re.++ (str.to_re "//DES") ((_ re.loop 9 9) (re.range "0" "9")) (str.to_re "O") ((_ re.loop 4 5) (re.range "0" "9")) (str.to_re ".jsp/Ui\u{a}"))))
; TSA\u{2F}S\u{3a}Users\u{5c}http\u{3A}\u{2F}\u{2F}tv\u{2E}seekmo\u{2E}com\u{2F}showme\u{2E}aspx\u{3F}keyword=
(assert (not (str.in_re X (str.to_re "TSA/S:Users\u{5c}http://tv.seekmo.com/showme.aspx?keyword=\u{a}"))))
; AD\d{2}[ ]\d{4}[ ]\d{4}[ ]\d{4}[ ]\d{4}[ ]\d{4}|AD\d{22}
(assert (str.in_re X (re.++ (str.to_re "AD") (re.union (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re " ") ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re " ") ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re " ") ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re " ") ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re " ") ((_ re.loop 4 4) (re.range "0" "9"))) (re.++ ((_ re.loop 22 22) (re.range "0" "9")) (str.to_re "\u{a}"))))))
; <[ \t]*[iI][mM][gG][ \t]*[sS][rR][cC][ \t]*=[ \t]*['\"]([^'\"]+)
(assert (not (str.in_re X (re.++ (str.to_re "<") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}"))) (re.union (str.to_re "i") (str.to_re "I")) (re.union (str.to_re "m") (str.to_re "M")) (re.union (str.to_re "g") (str.to_re "G")) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}"))) (re.union (str.to_re "s") (str.to_re "S")) (re.union (str.to_re "r") (str.to_re "R")) (re.union (str.to_re "c") (str.to_re "C")) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}"))) (str.to_re "=") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}"))) (re.union (str.to_re "'") (str.to_re "\u{22}")) (re.+ (re.union (str.to_re "'") (str.to_re "\u{22}"))) (str.to_re "\u{a}")))))
(check-sat)
