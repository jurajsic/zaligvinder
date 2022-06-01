(declare-const X String)
; [NS] \d{1,}(\:[0-5]\d){2}.{0,1}\d{0,},[EW] \d{1,}(\:[0-5]\d){2}.{0,1}\d{0,}
(assert (not (str.in_re X (re.++ (re.union (str.to_re "N") (str.to_re "S")) (str.to_re " ") (re.+ (re.range "0" "9")) ((_ re.loop 2 2) (re.++ (str.to_re ":") (re.range "0" "5") (re.range "0" "9"))) (re.opt re.allchar) (re.* (re.range "0" "9")) (str.to_re ",") (re.union (str.to_re "E") (str.to_re "W")) (str.to_re " ") (re.+ (re.range "0" "9")) ((_ re.loop 2 2) (re.++ (str.to_re ":") (re.range "0" "5") (re.range "0" "9"))) (re.opt re.allchar) (re.* (re.range "0" "9")) (str.to_re "\u{a}")))))
; /filename=[^\n]*\u{2e}otf/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".otf/i\u{a}")))))
; filename=\u{22}\s+www\u{2E}peer2mail\u{2E}com.*LOG
(assert (str.in_re X (re.++ (str.to_re "filename=\u{22}") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "www.peer2mail.com") (re.* re.allchar) (str.to_re "LOG\u{a}"))))
(check-sat)
