(set-logic QF_SLIA)
(declare-const X String)
; /filename=[^\n]*\u{2e}mid/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".mid/i\u{a}"))))
; ^[^a-zA-Z0-9]+$
(assert (str.in_re X (re.++ (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9"))) (str.to_re "\u{a}"))))
; ^[0-9]{2}-[0-9]{8}-[0-9]$
(assert (not (str.in_re X (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 8 8) (re.range "0" "9")) (str.to_re "-") (re.range "0" "9") (str.to_re "\u{a}")))))
(check-sat)
