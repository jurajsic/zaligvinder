(set-logic QF_SLIA)
(declare-const X String)
; (((^\s*)*\S+\s+)|(\S+)){1,5}
(assert (str.in_re X (re.++ ((_ re.loop 1 5) (re.union (re.++ (re.* (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")))) (re.+ (re.comp (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")))) (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")))) (re.+ (re.comp (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")))))) (str.to_re "\u{a}"))))
; ^((\\{2}\w+)\$?)((\\{1}\w+)*$)
(assert (not (str.in_re X (re.++ (re.* (re.++ ((_ re.loop 1 1) (str.to_re "\u{5c}")) (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))))) (str.to_re "\u{a}") (re.opt (str.to_re "$")) ((_ re.loop 2 2) (str.to_re "\u{5c}")) (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_")))))))
; X-Mailer\u{3a}[^\n\r]*Host\u{3A}\s+cyber@yahoo\u{2E}com
(assert (not (str.in_re X (re.++ (str.to_re "X-Mailer:\u{13}") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "Host:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "cyber@yahoo.com\u{a}")))))
; ^[-\w`~!@#$%^&*\(\)+={}|\[\]\\:";'<>?,.\/ ]*$
(assert (not (str.in_re X (re.++ (re.* (re.union (str.to_re "-") (str.to_re "`") (str.to_re "~") (str.to_re "!") (str.to_re "@") (str.to_re "#") (str.to_re "$") (str.to_re "%") (str.to_re "^") (str.to_re "&") (str.to_re "*") (str.to_re "(") (str.to_re ")") (str.to_re "+") (str.to_re "=") (str.to_re "{") (str.to_re "}") (str.to_re "|") (str.to_re "[") (str.to_re "]") (str.to_re "\u{5c}") (str.to_re ":") (str.to_re "\u{22}") (str.to_re ";") (str.to_re "'") (str.to_re "<") (str.to_re ">") (str.to_re "?") (str.to_re ",") (str.to_re ".") (str.to_re "/") (str.to_re " ") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "\u{a}")))))
(check-sat)
