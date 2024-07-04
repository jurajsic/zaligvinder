(set-logic QF_SLIA)
(declare-const X String)
; /[^\u{d}\u{a}\u{9}\u{20}-\u{7e}]{4}/P
(assert (not (str.in_re X (re.++ (str.to_re "/") ((_ re.loop 4 4) (re.union (str.to_re "\u{d}") (str.to_re "\u{a}") (str.to_re "\u{9}") (re.range " " "~"))) (str.to_re "/P\u{a}")))))
; ^(([-\w \.]+)|(""[-\w \.]+"") )?<([\w\-\.]+)@((\[([0-9]{1,3}\.){3}[0-9]{1,3}\])|(([\w\-]+\.)+)([a-zA-Z]{2,4}))>$
(assert (not (str.in_re X (re.++ (re.opt (re.union (re.+ (re.union (str.to_re "-") (str.to_re " ") (str.to_re ".") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (re.++ (str.to_re " \u{22}\u{22}") (re.+ (re.union (str.to_re "-") (str.to_re " ") (str.to_re ".") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "\u{22}\u{22}")))) (str.to_re "<") (re.+ (re.union (str.to_re "-") (str.to_re ".") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "@") (re.union (re.++ (str.to_re "[") ((_ re.loop 3 3) (re.++ ((_ re.loop 1 3) (re.range "0" "9")) (str.to_re "."))) ((_ re.loop 1 3) (re.range "0" "9")) (str.to_re "]")) (re.++ (re.+ (re.++ (re.+ (re.union (str.to_re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "."))) ((_ re.loop 2 4) (re.union (re.range "a" "z") (re.range "A" "Z"))))) (str.to_re ">\u{a}")))))
(check-sat)
