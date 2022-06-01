(declare-const X String)
; /\u{2e}paq8o([\?\u{5c}\u{2f}]|$)/smiU
(assert (str.in_re X (re.++ (str.to_re "/.paq8o") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}"))))
; /^loginpost\u{7c}\d+\u{7c}\d+\u{7C}[a-z0-9]+\u{2E}[a-z]{2,3}\u{7C}[a-z0-9]+\u{7C}/
(assert (not (str.in_re X (re.++ (str.to_re "/loginpost|") (re.+ (re.range "0" "9")) (str.to_re "|") (re.+ (re.range "0" "9")) (str.to_re "|") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re ".") ((_ re.loop 2 3) (re.range "a" "z")) (str.to_re "|") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re "|/\u{a}")))))
; LogsHost\u{3a}searches\u{2E}worldtostart\u{2E}com
(assert (not (str.in_re X (str.to_re "LogsHost:searches.worldtostart.com\u{a}"))))
(check-sat)
