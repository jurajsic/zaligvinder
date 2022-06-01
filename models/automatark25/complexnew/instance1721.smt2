(declare-const X String)
; EIcdpnode=reportUID\u{2F}ServertoX-Mailer\u{3a}
(assert (not (str.in_re X (str.to_re "EIcdpnode=reportUID/ServertoX-Mailer:\u{13}\u{a}"))))
; (^[0-9]{0,10}$)
(assert (str.in_re X (re.++ ((_ re.loop 0 10) (re.range "0" "9")) (str.to_re "\u{a}"))))
; /\u{2e}xap([\?\u{5c}\u{2f}]|$)/smiU
(assert (str.in_re X (re.++ (str.to_re "/.xap") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}"))))
; /\u{2e}cgm([\?\u{5c}\u{2f}]|$)/smiU
(assert (not (str.in_re X (re.++ (str.to_re "/.cgm") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}")))))
; /\/[a-f0-9]{32}\/[a-f0-9]{32}\u{22}/R
(assert (not (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 32 32) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "/") ((_ re.loop 32 32) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "\u{22}/R\u{a}")))))
(check-sat)
