(declare-const X String)
; /filename\s*=\s*[^\r\n]*?\u{2e}application[\u{22}\u{27}\u{3b}\s\r\n]/i
(assert (str.in_re X (re.++ (str.to_re "/filename") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "=") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.* (re.union (str.to_re "\u{d}") (str.to_re "\u{a}"))) (str.to_re ".application") (re.union (str.to_re "\u{22}") (str.to_re "'") (str.to_re ";") (str.to_re "\u{d}") (str.to_re "\u{a}") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "/i\u{a}"))))
; ^\${1}[a-z]{1}[a-z\d]{0,6}$
(assert (str.in_re X (re.++ ((_ re.loop 1 1) (str.to_re "$")) ((_ re.loop 1 1) (re.range "a" "z")) ((_ re.loop 0 6) (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re "\u{a}"))))
(check-sat)
