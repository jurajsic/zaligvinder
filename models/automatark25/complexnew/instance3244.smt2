(declare-const X String)
; ^[http://www.|www.][\S]+$
(assert (str.in_re X (re.++ (re.union (str.to_re "h") (str.to_re "t") (str.to_re "p") (str.to_re ":") (str.to_re "/") (str.to_re "w") (str.to_re ".") (str.to_re "|")) (re.+ (re.comp (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")))) (str.to_re "\u{a}"))))
; /^\/\d{2,4}\.xap$/U
(assert (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 2 4) (re.range "0" "9")) (str.to_re ".xap/U\u{a}"))))
(check-sat)
