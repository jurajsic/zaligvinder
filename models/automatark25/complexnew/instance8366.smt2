(declare-const X String)
; ^([7-9]{1})([0-9]{9})$
(assert (str.in_re X (re.++ ((_ re.loop 1 1) (re.range "7" "9")) ((_ re.loop 9 9) (re.range "0" "9")) (str.to_re "\u{a}"))))
; ^[^\\\/\?\*\"\'\>\<\:\|]*$
(assert (str.in_re X (re.++ (re.* (re.union (str.to_re "\u{5c}") (str.to_re "/") (str.to_re "?") (str.to_re "*") (str.to_re "\u{22}") (str.to_re "'") (str.to_re ">") (str.to_re "<") (str.to_re ":") (str.to_re "|"))) (str.to_re "\u{a}"))))
; /filename=[^\n]*\u{2e}cnt/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".cnt/i\u{a}"))))
; /\u{2e}asx([\?\u{5c}\u{2f}]|$)/smiU
(assert (str.in_re X (re.++ (str.to_re "/.asx") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}"))))
(check-sat)
