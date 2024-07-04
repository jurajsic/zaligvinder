(set-logic QF_SLIA)
(declare-const X String)
; /^From\u{3a}[^\r\n]*SpyBuddy/smi
(assert (str.in_re X (re.++ (str.to_re "/From:") (re.* (re.union (str.to_re "\u{d}") (str.to_re "\u{a}"))) (str.to_re "SpyBuddy/smi\u{a}"))))
; ^[^\~\`\!\@\#\$\%\^\&\*\(\)\-\_\=\+\\\|\[\]\{\}\;\:\"\'\,\<\./\>\?\s](([a-zA-Z0-9]*[-_\./]?[a-zA-Z0-9]{1,})*)$
(assert (not (str.in_re X (re.++ (re.union (str.to_re "~") (str.to_re "`") (str.to_re "!") (str.to_re "@") (str.to_re "#") (str.to_re "$") (str.to_re "%") (str.to_re "^") (str.to_re "&") (str.to_re "*") (str.to_re "(") (str.to_re ")") (str.to_re "-") (str.to_re "_") (str.to_re "=") (str.to_re "+") (str.to_re "\u{5c}") (str.to_re "|") (str.to_re "[") (str.to_re "]") (str.to_re "{") (str.to_re "}") (str.to_re ";") (str.to_re ":") (str.to_re "\u{22}") (str.to_re "'") (str.to_re ",") (str.to_re "<") (str.to_re ".") (str.to_re "/") (str.to_re ">") (str.to_re "?") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (re.* (re.++ (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9"))) (re.opt (re.union (str.to_re "-") (str.to_re "_") (str.to_re ".") (str.to_re "/"))) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9"))))) (str.to_re "\u{a}")))))
; /(\d*\.?\d+)\s?(px|em|ex|%|in|cn|mm|pt|pc+)/igm
(assert (not (str.in_re X (re.++ (str.to_re "/") (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.union (str.to_re "px") (str.to_re "em") (str.to_re "ex") (str.to_re "%") (str.to_re "in") (str.to_re "cn") (str.to_re "mm") (str.to_re "pt") (re.++ (str.to_re "p") (re.+ (str.to_re "c")))) (str.to_re "/igm\u{a}") (re.* (re.range "0" "9")) (re.opt (str.to_re ".")) (re.+ (re.range "0" "9"))))))
(check-sat)
