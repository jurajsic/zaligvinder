(declare-const X String)
; act=\s+smrtshpr-cs-verDANavExcel
(assert (not (str.in_re X (re.++ (str.to_re "act=") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "smrtshpr-cs-\u{13}verDANavExcel\u{a}")))))
(check-sat)
