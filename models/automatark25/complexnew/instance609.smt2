(set-logic QF_SLIA)
(declare-const X String)
; <[a-zA-Z][^>]*\son\w+=(\w+|'[^']*'|"[^"]*")[^>]*>
(assert (not (str.in_re X (re.++ (str.to_re "<") (re.union (re.range "a" "z") (re.range "A" "Z")) (re.* (re.comp (str.to_re ">"))) (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "on") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "=") (re.union (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (re.++ (str.to_re "'") (re.* (re.comp (str.to_re "'"))) (str.to_re "'")) (re.++ (str.to_re "\u{22}") (re.* (re.comp (str.to_re "\u{22}"))) (str.to_re "\u{22}"))) (re.* (re.comp (str.to_re ">"))) (str.to_re ">\u{a}")))))
; /^\/[\w-]{64}$/U
(assert (not (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 64 64) (re.union (str.to_re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "/U\u{a}")))))
; LOG\s+spyblini\u{2E}iniUpdateUser-Agent\u{3A}
(assert (str.in_re X (re.++ (str.to_re "LOG") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "spyblini.iniUpdateUser-Agent:\u{a}"))))
; [0][^0]|([^0]{1}(.){1})|[^0]*
(assert (str.in_re X (re.union (re.++ (str.to_re "0") (re.comp (str.to_re "0"))) (re.++ ((_ re.loop 1 1) (re.comp (str.to_re "0"))) ((_ re.loop 1 1) re.allchar)) (re.++ (re.* (re.comp (str.to_re "0"))) (str.to_re "\u{a}")))))
(check-sat)
