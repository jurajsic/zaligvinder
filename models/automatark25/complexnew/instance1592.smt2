(declare-const X String)
; Kontiki\s+resultsmaster\u{2E}com\u{7c}roogoo\u{7c}
(assert (str.in_re X (re.++ (str.to_re "Kontiki") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "resultsmaster.com\u{13}|roogoo|\u{a}"))))
; ((079)|(078)|(077)){1}[0-9]{7}
(assert (str.in_re X (re.++ ((_ re.loop 1 1) (re.union (str.to_re "079") (str.to_re "078") (str.to_re "077"))) ((_ re.loop 7 7) (re.range "0" "9")) (str.to_re "\u{a}"))))
; ^([1-9]+)?[13579]$
(assert (not (str.in_re X (re.++ (re.opt (re.+ (re.range "1" "9"))) (re.union (str.to_re "1") (str.to_re "3") (str.to_re "5") (str.to_re "7") (str.to_re "9")) (str.to_re "\u{a}")))))
; /\u{2e}aif[cf]?([\?\u{5c}\u{2f}]|$)/smiU
(assert (str.in_re X (re.++ (str.to_re "/.aif") (re.opt (re.union (str.to_re "c") (str.to_re "f"))) (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}"))))
(check-sat)
