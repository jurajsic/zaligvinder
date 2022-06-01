(declare-const X String)
; <img[^>]*src=\"?([^\"]*)\"?([^>]*alt=\"?([^\"]*)\"?)?[^>]*>
(assert (not (str.in_re X (re.++ (str.to_re "<img") (re.* (re.comp (str.to_re ">"))) (str.to_re "src=") (re.opt (str.to_re "\u{22}")) (re.* (re.comp (str.to_re "\u{22}"))) (re.opt (str.to_re "\u{22}")) (re.opt (re.++ (re.* (re.comp (str.to_re ">"))) (str.to_re "alt=") (re.opt (str.to_re "\u{22}")) (re.* (re.comp (str.to_re "\u{22}"))) (re.opt (str.to_re "\u{22}")))) (re.* (re.comp (str.to_re ">"))) (str.to_re ">\u{a}")))))
; ^\d+\*\d+\*\d+$
(assert (str.in_re X (re.++ (re.+ (re.range "0" "9")) (str.to_re "*") (re.+ (re.range "0" "9")) (str.to_re "*") (re.+ (re.range "0" "9")) (str.to_re "\u{a}"))))
; \bhttp(s?)\:\/\/[a-zA-Z0-9\/\?\-\.\&\(\)_=#]*
(assert (not (str.in_re X (re.++ (str.to_re "http") (re.opt (str.to_re "s")) (str.to_re "://") (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "/") (str.to_re "?") (str.to_re "-") (str.to_re ".") (str.to_re "&") (str.to_re "(") (str.to_re ")") (str.to_re "_") (str.to_re "=") (str.to_re "#"))) (str.to_re "\u{a}")))))
; \u{28}robert\u{40}blackcastlesoft\u{2E}com\u{29}
(assert (not (str.in_re X (str.to_re "(robert@blackcastlesoft.com)\u{a}"))))
; ^[1-9]{3}\s{0,1}[0-9]{3}$
(assert (not (str.in_re X (re.++ ((_ re.loop 3 3) (re.range "1" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "\u{a}")))))
(check-sat)
