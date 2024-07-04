(set-logic QF_SLIA)
(declare-const X String)
; /\u{2f}panda\u{2f}\u{3f}u\u{3d}[a-z0-9]{32}/U
(assert (str.in_re X (re.++ (str.to_re "//panda/?u=") ((_ re.loop 32 32) (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re "/U\u{a}"))))
; [a-zA-Z]{3,}://[a-zA-Z0-9\.]+/*[a-zA-Z0-9/\\%_.]*\?*[a-zA-Z0-9/\\%_.=&]*
(assert (not (str.in_re X (re.++ (str.to_re "://") (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "."))) (re.* (str.to_re "/")) (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "/") (str.to_re "\u{5c}") (str.to_re "%") (str.to_re "_") (str.to_re "."))) (re.* (str.to_re "?")) (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "/") (str.to_re "\u{5c}") (str.to_re "%") (str.to_re "_") (str.to_re ".") (str.to_re "=") (str.to_re "&"))) (str.to_re "\u{a}") ((_ re.loop 3 3) (re.union (re.range "a" "z") (re.range "A" "Z"))) (re.* (re.union (re.range "a" "z") (re.range "A" "Z")))))))
; WebsiteUser-Agent\u{3A}httphostfast-look\u{2E}com
(assert (not (str.in_re X (str.to_re "WebsiteUser-Agent:httphostfast-look.com\u{a}"))))
(check-sat)
