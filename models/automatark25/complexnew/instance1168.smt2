(declare-const X String)
; \stoolbar\.anwb\.nl.*Host\u{3A}
(assert (str.in_re X (re.++ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "toolbar.anwb.nl") (re.* re.allchar) (str.to_re "Host:\u{a}"))))
; /filename=[^\n]*\u{2e}ani/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".ani/i\u{a}"))))
; /^\+?([0-9]{2})\)?[-. ]?([0-9]{4})[-. ]?([0-9]{4})$/;
(assert (str.in_re X (re.++ (str.to_re "/") (re.opt (str.to_re "+")) ((_ re.loop 2 2) (re.range "0" "9")) (re.opt (str.to_re ")")) (re.opt (re.union (str.to_re "-") (str.to_re ".") (str.to_re " "))) ((_ re.loop 4 4) (re.range "0" "9")) (re.opt (re.union (str.to_re "-") (str.to_re ".") (str.to_re " "))) ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "/;\u{a}"))))
; /\u{2f}1020\d{6,16}$/U
(assert (not (str.in_re X (re.++ (str.to_re "//1020") ((_ re.loop 6 16) (re.range "0" "9")) (str.to_re "/U\u{a}")))))
(check-sat)
