(declare-const X String)
; We\d+pjpoptwql\u{2f}rlnjX-Mailer\u{3a}
(assert (str.in_re X (re.++ (str.to_re "We") (re.+ (re.range "0" "9")) (str.to_re "pjpoptwql/rlnjX-Mailer:\u{13}\u{a}"))))
; /filename=[^\n]*\u{2e}addin/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".addin/i\u{a}")))))
; ^([a-z0-9]+([\-a-z0-9]*[a-z0-9]+)?\.){0,}([a-z0-9]+([\-a-z0-9]*[a-z0-9]+)?){1,63}(\.[a-z0-9]{2,7})+$
(assert (not (str.in_re X (re.++ (re.* (re.++ (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (re.opt (re.++ (re.* (re.union (str.to_re "-") (re.range "a" "z") (re.range "0" "9"))) (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))))) (str.to_re "."))) ((_ re.loop 1 63) (re.++ (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (re.opt (re.++ (re.* (re.union (str.to_re "-") (re.range "a" "z") (re.range "0" "9"))) (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))))))) (re.+ (re.++ (str.to_re ".") ((_ re.loop 2 7) (re.union (re.range "a" "z") (re.range "0" "9"))))) (str.to_re "\u{a}")))))
; forum=.*Explorer\s+Host\u{3A}act=Host\u{3a}User-Agent\u{3A}
(assert (str.in_re X (re.++ (str.to_re "forum=") (re.* re.allchar) (str.to_re "Explorer") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Host:act=Host:User-Agent:\u{a}"))))
(check-sat)
