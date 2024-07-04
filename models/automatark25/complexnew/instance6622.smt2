(set-logic QF_SLIA)
(declare-const X String)
; Login\d+dll\u{3F}HOST\u{3A}contains
(assert (not (str.in_re X (re.++ (str.to_re "Login") (re.+ (re.range "0" "9")) (str.to_re "dll?HOST:contains\u{a}")))))
; /\/software\u{2e}php\u{3f}[0-9]{15,}/Ui
(assert (not (str.in_re X (re.++ (str.to_re "//software.php?/Ui\u{a}") ((_ re.loop 15 15) (re.range "0" "9")) (re.* (re.range "0" "9"))))))
; /filename=[^\n]*\u{2e}rdp/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".rdp/i\u{a}")))))
; ^[A-Za-z]{6}[0-9]{2}[A-Za-z]{1}[0-9]{2}[A-Za-z]{1}[0-9]{3}[A-Za-z]{1}$
(assert (str.in_re X (re.++ ((_ re.loop 6 6) (re.union (re.range "A" "Z") (re.range "a" "z"))) ((_ re.loop 2 2) (re.range "0" "9")) ((_ re.loop 1 1) (re.union (re.range "A" "Z") (re.range "a" "z"))) ((_ re.loop 2 2) (re.range "0" "9")) ((_ re.loop 1 1) (re.union (re.range "A" "Z") (re.range "a" "z"))) ((_ re.loop 3 3) (re.range "0" "9")) ((_ re.loop 1 1) (re.union (re.range "A" "Z") (re.range "a" "z"))) (str.to_re "\u{a}"))))
(check-sat)
