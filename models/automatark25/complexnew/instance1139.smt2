(set-logic QF_SLIA)
(declare-const X String)
; ^#?([a-f]|[A-F]|[0-9]){3}(([a-f]|[A-F]|[0-9]){3})?$
(assert (not (str.in_re X (re.++ (re.opt (str.to_re "#")) ((_ re.loop 3 3) (re.union (re.range "a" "f") (re.range "A" "F") (re.range "0" "9"))) (re.opt ((_ re.loop 3 3) (re.union (re.range "a" "f") (re.range "A" "F") (re.range "0" "9")))) (str.to_re "\u{a}")))))
; ^[0-9]{3}[-][0-9]{4}$
(assert (str.in_re X (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}"))))
; \u{2E}php\s+Host\u{3A}origin\u{3D}sidefind\u{22}The
(assert (not (str.in_re X (re.++ (str.to_re ".php") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Host:origin=sidefind\u{22}The\u{a}")))))
; \"[^"]+\"|\([^)]+\)|[^\"\s\()]+
(assert (not (str.in_re X (re.union (re.++ (str.to_re "\u{22}") (re.+ (re.comp (str.to_re "\u{22}"))) (str.to_re "\u{22}")) (re.++ (str.to_re "(") (re.+ (re.comp (str.to_re ")"))) (str.to_re ")")) (re.++ (re.+ (re.union (str.to_re "\u{22}") (str.to_re "(") (str.to_re ")") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "\u{a}"))))))
; /\u{2e}rtf([\?\u{5c}\u{2f}]|$)/smiU
(assert (not (str.in_re X (re.++ (str.to_re "/.rtf") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}")))))
(check-sat)
