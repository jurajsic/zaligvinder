(set-logic QF_SLIA)
(declare-const X String)
; Supervisor\s+User-Agent\u{3A}
(assert (str.in_re X (re.++ (str.to_re "Supervisor") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "User-Agent:\u{a}"))))
; /^[a-zA-Z\s]+$/
(assert (str.in_re X (re.++ (str.to_re "/") (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "/\u{a}"))))
; (01*0|1)*
(assert (not (str.in_re X (re.++ (re.* (re.union (re.++ (str.to_re "0") (re.* (str.to_re "1")) (str.to_re "0")) (str.to_re "1"))) (str.to_re "\u{a}")))))
; /\u{2e}ttf([\?\u{5c}\u{2f}]|$)/smiU
(assert (not (str.in_re X (re.++ (str.to_re "/.ttf") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}")))))
; /^SSID=[a-zA-Z\d]{43}\u{3B}\u{20}A=[0-3]$/C
(assert (not (str.in_re X (re.++ (str.to_re "/SSID=") ((_ re.loop 43 43) (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9"))) (str.to_re "; A=") (re.range "0" "3") (str.to_re "/C\u{a}")))))
(check-sat)
