(set-logic QF_SLIA)
(declare-const X String)
; /^\/[\w-]{48}\.[a-z]{2,8}[0-9]?$/U
(assert (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 48 48) (re.union (str.to_re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re ".") ((_ re.loop 2 8) (re.range "a" "z")) (re.opt (re.range "0" "9")) (str.to_re "/U\u{a}"))))
; Server\s+www\u{2E}peer2mail\u{2E}comsubject\u{3A}fileId\u{3d}\u{5b}
(assert (str.in_re X (re.++ (str.to_re "Server") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "www.peer2mail.comsubject:fileId=[\u{a}"))))
; ^((\-|d|l|p|s){1}(\-|r|w|x){9})$
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") ((_ re.loop 1 1) (re.union (str.to_re "-") (str.to_re "d") (str.to_re "l") (str.to_re "p") (str.to_re "s"))) ((_ re.loop 9 9) (re.union (str.to_re "-") (str.to_re "r") (str.to_re "w") (str.to_re "x")))))))
; ^[A-Z]{2,4}[0-9][A-Z0-9]+$
(assert (not (str.in_re X (re.++ ((_ re.loop 2 4) (re.range "A" "Z")) (re.range "0" "9") (re.+ (re.union (re.range "A" "Z") (re.range "0" "9"))) (str.to_re "\u{a}")))))
; ^[+-]?\d*(([,.]\d{3})+)?([,.]\d+)?([eE][+-]?\d+)?$
(assert (not (str.in_re X (re.++ (re.opt (re.union (str.to_re "+") (str.to_re "-"))) (re.* (re.range "0" "9")) (re.opt (re.+ (re.++ (re.union (str.to_re ",") (str.to_re ".")) ((_ re.loop 3 3) (re.range "0" "9"))))) (re.opt (re.++ (re.union (str.to_re ",") (str.to_re ".")) (re.+ (re.range "0" "9")))) (re.opt (re.++ (re.union (str.to_re "e") (str.to_re "E")) (re.opt (re.union (str.to_re "+") (str.to_re "-"))) (re.+ (re.range "0" "9")))) (str.to_re "\u{a}")))))
(check-sat)
