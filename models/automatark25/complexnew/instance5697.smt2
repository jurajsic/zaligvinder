(declare-const X String)
; \b[1-9]\b
(assert (str.in_re X (re.++ (re.range "1" "9") (str.to_re "\u{a}"))))
; /\.gif\u{3f}[a-f0-9]{4,7}\u{3d}\d{6,8}$/U
(assert (str.in_re X (re.++ (str.to_re "/.gif?") ((_ re.loop 4 7) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "=") ((_ re.loop 6 8) (re.range "0" "9")) (str.to_re "/U\u{a}"))))
; <\s*a\s[^>]*\bhref\s*=\s*
(assert (str.in_re X (re.++ (str.to_re "<") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "a") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (re.* (re.comp (str.to_re ">"))) (str.to_re "href") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "=") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "\u{a}"))))
(check-sat)
