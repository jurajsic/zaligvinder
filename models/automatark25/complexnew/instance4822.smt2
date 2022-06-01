(declare-const X String)
; \\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}
(assert (str.in_re X (re.++ (str.to_re "\u{5c}") ((_ re.loop 1 3) (str.to_re "d")) (str.to_re "\u{5c}") re.allchar (str.to_re "\u{5c}") ((_ re.loop 1 3) (str.to_re "d")) (str.to_re "\u{5c}") re.allchar (str.to_re "\u{5c}") ((_ re.loop 1 3) (str.to_re "d")) (str.to_re "\u{5c}") re.allchar (str.to_re "\u{5c}") ((_ re.loop 1 3) (str.to_re "d")) (str.to_re "\u{a}"))))
; /filename=[^\n]*\u{2e}xbm/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".xbm/i\u{a}")))))
; /\u{2E}quo([\?\u{5c}\u{2f}]|$)/smiU
(assert (not (str.in_re X (re.++ (str.to_re "/.quo") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}")))))
; ^[a-zA-Z][a-zA-Z0-9_]+$
(assert (not (str.in_re X (re.++ (re.union (re.range "a" "z") (re.range "A" "Z")) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_"))) (str.to_re "\u{a}")))))
(check-sat)
