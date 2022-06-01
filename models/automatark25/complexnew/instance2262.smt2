(declare-const X String)
; ^(([+]\d{2}[ ][1-9]\d{0,2}[ ])|([0]\d{1,3}[-]))((\d{2}([ ]\d{2}){2})|(\d{3}([ ]\d{3})*([ ]\d{2})+))$
(assert (not (str.in_re X (re.++ (re.union (re.++ (str.to_re "+") ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re " ") (re.range "1" "9") ((_ re.loop 0 2) (re.range "0" "9")) (str.to_re " ")) (re.++ (str.to_re "0") ((_ re.loop 1 3) (re.range "0" "9")) (str.to_re "-"))) (re.union (re.++ ((_ re.loop 2 2) (re.range "0" "9")) ((_ re.loop 2 2) (re.++ (str.to_re " ") ((_ re.loop 2 2) (re.range "0" "9"))))) (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (re.* (re.++ (str.to_re " ") ((_ re.loop 3 3) (re.range "0" "9")))) (re.+ (re.++ (str.to_re " ") ((_ re.loop 2 2) (re.range "0" "9")))))) (str.to_re "\u{a}")))))
; Server.*Host\u{3a}\s+newsSoftActivitypassword\u{3B}1\u{3B}Optix
(assert (not (str.in_re X (re.++ (str.to_re "Server") (re.* re.allchar) (str.to_re "Host:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "newsSoftActivity\u{13}password;1;Optix\u{a}")))))
; /\u{2e}ttf([\?\u{5c}\u{2f}]|$)/smiU
(assert (str.in_re X (re.++ (str.to_re "/.ttf") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}"))))
; /\u{2E}rmf([\?\u{5c}\u{2f}]|$)/smiU
(assert (str.in_re X (re.++ (str.to_re "/.rmf") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}"))))
; ^(0{0,1}[1-9][0-9]){1}(\s){0,1}(\-){0,1}(\s){0,1}[1-9]{1}([0-9]{3}|[0-9]{4})(\-){0,1}(\s){0,1}[0-9]{4}$
(assert (not (str.in_re X (re.++ ((_ re.loop 1 1) (re.++ (re.opt (str.to_re "0")) (re.range "1" "9") (re.range "0" "9"))) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.opt (str.to_re "-")) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 1 1) (re.range "1" "9")) (re.union ((_ re.loop 3 3) (re.range "0" "9")) ((_ re.loop 4 4) (re.range "0" "9"))) (re.opt (str.to_re "-")) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}")))))
(check-sat)
