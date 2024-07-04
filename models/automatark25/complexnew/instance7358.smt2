(set-logic QF_SLIA)
(declare-const X String)
; EFError.*\u{2F}cs\u{2F}pop4\u{2F}\s+
(assert (str.in_re X (re.++ (str.to_re "EFError") (re.* re.allchar) (str.to_re "/cs/pop4/") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "\u{a}"))))
; User-Agent\u{3A}Host\u{3a}\u{22}The
(assert (not (str.in_re X (str.to_re "User-Agent:Host:\u{22}The\u{a}"))))
; (vi(v))?d
(assert (not (str.in_re X (re.++ (re.opt (str.to_re "viv")) (str.to_re "d\u{a}")))))
; ^\s*([A-Za-z]{2,4}\.?\s*)?(['\-A-Za-z]+\s*){1,2}([A-Za-z]+\.?\s*)?(['\-A-Za-z]+\s*){1,2}(([jJsSrR]{2}\.)|([XIV]{1,6}))?\s*$
(assert (str.in_re X (re.++ (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.opt (re.++ ((_ re.loop 2 4) (re.union (re.range "A" "Z") (re.range "a" "z"))) (re.opt (str.to_re ".")) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))))) ((_ re.loop 1 2) (re.++ (re.+ (re.union (str.to_re "'") (str.to_re "-") (re.range "A" "Z") (re.range "a" "z"))) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))))) (re.opt (re.++ (re.+ (re.union (re.range "A" "Z") (re.range "a" "z"))) (re.opt (str.to_re ".")) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))))) ((_ re.loop 1 2) (re.++ (re.+ (re.union (str.to_re "'") (str.to_re "-") (re.range "A" "Z") (re.range "a" "z"))) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))))) (re.opt (re.union (re.++ ((_ re.loop 2 2) (re.union (str.to_re "j") (str.to_re "J") (str.to_re "s") (str.to_re "S") (str.to_re "r") (str.to_re "R"))) (str.to_re ".")) ((_ re.loop 1 6) (re.union (str.to_re "X") (str.to_re "I") (str.to_re "V"))))) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "\u{a}"))))
(check-sat)
