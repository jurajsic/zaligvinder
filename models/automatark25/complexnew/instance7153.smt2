(set-logic QF_SLIA)
(declare-const X String)
; Host\u{3a}\dATTENTION\u{3A}.*User-Agent\u{3A}
(assert (str.in_re X (re.++ (str.to_re "Host:") (re.range "0" "9") (str.to_re "ATTENTION:") (re.* re.allchar) (str.to_re "User-Agent:\u{a}"))))
; /filename=[^\n]*\u{2e}otf/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".otf/i\u{a}")))))
; User-Agent\u{3A}User-Agent\u{3A}Host\u{3a}
(assert (str.in_re X (str.to_re "User-Agent:User-Agent:Host:\u{a}")))
; Host\u{3A}\s+Host\u{3A}\u{7c}roogoo\u{7c}Testiufilfwulmfi\u{2f}riuf\.lio
(assert (not (str.in_re X (re.++ (str.to_re "Host:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Host:|roogoo|Testiufilfwulmfi/riuf.lio\u{a}")))))
; /filename=[^\n]*\u{2e}3gp/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".3gp/i\u{a}"))))
(check-sat)
