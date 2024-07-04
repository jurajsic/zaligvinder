(set-logic QF_SLIA)
(declare-const X String)
; ^[SFTG]\d{7}[A-Z]$
(assert (str.in_re X (re.++ (re.union (str.to_re "S") (str.to_re "F") (str.to_re "T") (str.to_re "G")) ((_ re.loop 7 7) (re.range "0" "9")) (re.range "A" "Z") (str.to_re "\u{a}"))))
; /\u{2F}[a-z]+\u{2e}png/Ui
(assert (str.in_re X (re.++ (str.to_re "//") (re.+ (re.range "a" "z")) (str.to_re ".png/Ui\u{a}"))))
; ^(([01][0-9]|[012][0-3]):([0-5][0-9]))*$
(assert (str.in_re X (re.++ (re.* (re.++ (re.union (re.++ (re.union (str.to_re "0") (str.to_re "1")) (re.range "0" "9")) (re.++ (re.union (str.to_re "0") (str.to_re "1") (str.to_re "2")) (re.range "0" "3"))) (str.to_re ":") (re.range "0" "5") (re.range "0" "9"))) (str.to_re "\u{a}"))))
; /\u{2e}vqf([\?\u{5c}\u{2f}]|$)/smiU
(assert (str.in_re X (re.++ (str.to_re "/.vqf") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}"))))
(check-sat)
