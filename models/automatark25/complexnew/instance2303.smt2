(set-logic QF_SLIA)
(declare-const X String)
; ^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w ]*.*))+\.(jpg|JPG)$
(assert (not (str.in_re X (re.++ (re.union (re.++ (re.union (re.range "a" "z") (re.range "A" "Z")) (str.to_re ":")) (re.++ (re.opt (str.to_re "$")) ((_ re.loop 2 2) (str.to_re "\u{5c}")) (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))))) (re.+ (re.++ (str.to_re "\u{5c}") (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_")) (re.* (re.union (str.to_re " ") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (re.* re.allchar))) (str.to_re ".") (re.union (str.to_re "jpg") (str.to_re "JPG")) (str.to_re "\u{a}")))))
; /filename=[^\n]*\u{2e}wm/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".wm/i\u{a}")))))
; SoftActivity\s+User-Agent\u{3A}.*LogsHost\u{3A}Host\u{3A}X-Mailer\u{3a}
(assert (not (str.in_re X (re.++ (str.to_re "SoftActivity\u{13}") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "User-Agent:") (re.* re.allchar) (str.to_re "LogsHost:Host:X-Mailer:\u{13}\u{a}")))))
; ([(]?\d{3}[)]?(-| |.)?\d{3}(-| |.)?\d{4})
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") (re.opt (str.to_re "(")) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (str.to_re ")")) (re.opt (re.union (str.to_re "-") (str.to_re " ") re.allchar)) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to_re "-") (str.to_re " ") re.allchar)) ((_ re.loop 4 4) (re.range "0" "9"))))))
(check-sat)
