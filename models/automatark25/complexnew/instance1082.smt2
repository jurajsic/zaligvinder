(declare-const X String)
; /filename=[^\n]*\u{2e}webm/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".webm/i\u{a}"))))
; ([1-9]|[1-2][0-9]|3[01])
(assert (str.in_re X (re.++ (re.union (re.range "1" "9") (re.++ (re.range "1" "2") (re.range "0" "9")) (re.++ (str.to_re "3") (re.union (str.to_re "0") (str.to_re "1")))) (str.to_re "\u{a}"))))
; (\d{6}[-\s]?\d{12})|(\d{4}[-\s]?\d{4}[-\s]?\d{4}[-\s]?\d{4})
(assert (str.in_re X (re.union (re.++ ((_ re.loop 6 6) (re.range "0" "9")) (re.opt (re.union (str.to_re "-") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 12 12) (re.range "0" "9"))) (re.++ (str.to_re "\u{a}") ((_ re.loop 4 4) (re.range "0" "9")) (re.opt (re.union (str.to_re "-") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 4 4) (re.range "0" "9")) (re.opt (re.union (str.to_re "-") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 4 4) (re.range "0" "9")) (re.opt (re.union (str.to_re "-") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 4 4) (re.range "0" "9"))))))
(check-sat)
