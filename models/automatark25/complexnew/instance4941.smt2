(declare-const X String)
; Server\u{3A}WordTheHost\u{3a}from
(assert (str.in_re X (str.to_re "Server:WordTheHost:from\u{a}")))
; /\/AES\d{9}O\d{4,5}\u{2e}jsp/Ui
(assert (str.in_re X (re.++ (str.to_re "//AES") ((_ re.loop 9 9) (re.range "0" "9")) (str.to_re "O") ((_ re.loop 4 5) (re.range "0" "9")) (str.to_re ".jsp/Ui\u{a}"))))
; /\u{2e}nab([\?\u{5c}\u{2f}]|$)/smiU
(assert (str.in_re X (re.++ (str.to_re "/.nab") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}"))))
(check-sat)
