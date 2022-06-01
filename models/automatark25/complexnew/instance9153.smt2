(declare-const X String)
; /User-Agent\:[^\u{a}\u{d}]+?Havij/H
(assert (not (str.in_re X (re.++ (str.to_re "/User-Agent:") (re.+ (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "Havij/H\u{a}")))))
; (^\([0]\d{1}\))(\d{7}$)|(^\([0][2]\d{1}\))(\d{6,8}$)|([0][8][0][0])([\s])(\d{5,8}$)
(assert (str.in_re X (re.union (re.++ ((_ re.loop 7 7) (re.range "0" "9")) (str.to_re "(0") ((_ re.loop 1 1) (re.range "0" "9")) (str.to_re ")")) (re.++ ((_ re.loop 6 8) (re.range "0" "9")) (str.to_re "(02") ((_ re.loop 1 1) (re.range "0" "9")) (str.to_re ")")) (re.++ (str.to_re "0800") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) ((_ re.loop 5 8) (re.range "0" "9")) (str.to_re "\u{a}")))))
; /\u{2e}ses([\?\u{5c}\u{2f}]|$)/smiU
(assert (str.in_re X (re.++ (str.to_re "/.ses") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}"))))
; ^([a-zA-Z]+[\'\,\.\-]?[a-zA-Z ]*)+[ ]([a-zA-Z]+[\'\,\.\-]?[a-zA-Z ]+)+$
(assert (str.in_re X (re.++ (re.+ (re.++ (re.+ (re.union (re.range "a" "z") (re.range "A" "Z"))) (re.opt (re.union (str.to_re "'") (str.to_re ",") (str.to_re ".") (str.to_re "-"))) (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (str.to_re " "))))) (str.to_re " ") (re.+ (re.++ (re.+ (re.union (re.range "a" "z") (re.range "A" "Z"))) (re.opt (re.union (str.to_re "'") (str.to_re ",") (str.to_re ".") (str.to_re "-"))) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (str.to_re " "))))) (str.to_re "\u{a}"))))
; \[DRIVE\w+updates[^\n\r]*\u{22}StarLogger\u{22}User-Agent\u{3A}JMailUser-Agent\u{3A}
(assert (str.in_re X (re.++ (str.to_re "[DRIVE") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "updates") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "\u{22}StarLogger\u{22}User-Agent:JMailUser-Agent:\u{a}"))))
(check-sat)
