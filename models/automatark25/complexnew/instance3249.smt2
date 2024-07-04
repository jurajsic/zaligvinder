(set-logic QF_SLIA)
(declare-const X String)
; ^[a-zA-Z_]{1}[a-zA-Z0-9_@$#]*$
(assert (not (str.in_re X (re.++ ((_ re.loop 1 1) (re.union (re.range "a" "z") (re.range "A" "Z") (str.to_re "_"))) (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_") (str.to_re "@") (str.to_re "$") (str.to_re "#"))) (str.to_re "\u{a}")))))
; snprtz\u{7C}dialnoref\u{3D}\u{25}user\u{5F}idPG=SPEEDBAR
(assert (str.in_re X (str.to_re "snprtz|dialnoref=%user_idPG=SPEEDBAR\u{a}")))
; CUSTOM\swww\u{2E}locators\u{2E}comas\u{2E}starware\u{2E}com
(assert (str.in_re X (re.++ (str.to_re "CUSTOM") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "www.locators.comas.starware.com\u{a}"))))
; ^(0{0,1}[1-9]|[12][0-9]|3[01])[- /.](0{0,1}[1-9]|1[012])[- /.](\d{2}|\d{4})$
(assert (str.in_re X (re.++ (re.union (re.++ (re.opt (str.to_re "0")) (re.range "1" "9")) (re.++ (re.union (str.to_re "1") (str.to_re "2")) (re.range "0" "9")) (re.++ (str.to_re "3") (re.union (str.to_re "0") (str.to_re "1")))) (re.union (str.to_re "-") (str.to_re " ") (str.to_re "/") (str.to_re ".")) (re.union (re.++ (re.opt (str.to_re "0")) (re.range "1" "9")) (re.++ (str.to_re "1") (re.union (str.to_re "0") (str.to_re "1") (str.to_re "2")))) (re.union (str.to_re "-") (str.to_re " ") (str.to_re "/") (str.to_re ".")) (re.union ((_ re.loop 2 2) (re.range "0" "9")) ((_ re.loop 4 4) (re.range "0" "9"))) (str.to_re "\u{a}"))))
(check-sat)
