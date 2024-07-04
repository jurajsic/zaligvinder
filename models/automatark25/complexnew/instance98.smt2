(set-logic QF_SLIA)
(declare-const X String)
; HXDownloadUser-Agent\u{3A}answerDeletingCookieReferer\u{3A}
(assert (str.in_re X (str.to_re "HXDownloadUser-Agent:answerDeletingCookieReferer:\u{a}")))
; /^\d+O\d+\.jsp\?[a-z0-9\u{3d}\u{2b}\u{2f}]{20}/iR
(assert (not (str.in_re X (re.++ (str.to_re "/") (re.+ (re.range "0" "9")) (str.to_re "O") (re.+ (re.range "0" "9")) (str.to_re ".jsp?") ((_ re.loop 20 20) (re.union (re.range "a" "z") (re.range "0" "9") (str.to_re "=") (str.to_re "+") (str.to_re "/"))) (str.to_re "/iR\u{a}")))))
; ^(\d{5})$|^([a-zA-Z]\d[a-zA-Z]( )?\d[a-zA-Z]\d)$
(assert (str.in_re X (re.union ((_ re.loop 5 5) (re.range "0" "9")) (re.++ (str.to_re "\u{a}") (re.union (re.range "a" "z") (re.range "A" "Z")) (re.range "0" "9") (re.union (re.range "a" "z") (re.range "A" "Z")) (re.opt (str.to_re " ")) (re.range "0" "9") (re.union (re.range "a" "z") (re.range "A" "Z")) (re.range "0" "9")))))
(check-sat)
