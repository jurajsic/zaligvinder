(declare-const X String)
; (^\*\.[a-zA-Z][a-zA-Z][a-zA-Z]$)|(^\*\.\*$)
(assert (not (str.in_re X (re.union (re.++ (str.to_re "*.") (re.union (re.range "a" "z") (re.range "A" "Z")) (re.union (re.range "a" "z") (re.range "A" "Z")) (re.union (re.range "a" "z") (re.range "A" "Z"))) (str.to_re "*.*\u{a}")))))
; /^[a-z]\u{3d}[a-f\d]{80,140}$/Pi
(assert (str.in_re X (re.++ (str.to_re "/") (re.range "a" "z") (str.to_re "=") ((_ re.loop 80 140) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "/Pi\u{a}"))))
; /filename=[^\n]*\u{2e}xspf/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".xspf/i\u{a}"))))
(check-sat)
