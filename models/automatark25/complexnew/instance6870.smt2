(declare-const X String)
; /\u{2e}wmf([\?\u{5c}\u{2f}]|$)/smiU
(assert (str.in_re X (re.++ (str.to_re "/.wmf") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}"))))
; Host\u{3a}[^\n\r]*A-311\s+lnzzlnbk\u{2f}pkrm\.finSubject\u{3a}Basic
(assert (not (str.in_re X (re.++ (str.to_re "Host:") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "A-311") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "lnzzlnbk/pkrm.finSubject:Basic\u{a}")))))
; /ID3\u{3}\u{0}.{5}([TW][A-Z]{3}|COMM)/smi
(assert (str.in_re X (re.++ (str.to_re "/ID3\u{3}\u{0}") ((_ re.loop 5 5) re.allchar) (re.union (re.++ (re.union (str.to_re "T") (str.to_re "W")) ((_ re.loop 3 3) (re.range "A" "Z"))) (str.to_re "COMM")) (str.to_re "/smi\u{a}"))))
; \u{2F}GR\s+\u{2A}PORT3\u{2A}\d+Host\u{3A}
(assert (str.in_re X (re.++ (str.to_re "/GR") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "*PORT3*") (re.+ (re.range "0" "9")) (str.to_re "Host:\u{a}"))))
; ^([a-zA-Z]+)://([a-zA-Z0-9_\-]+)((\.[a-zA-Z0-9_\-]+|[0-9]{1,3})+)\.([a-zA-Z]{2,6}|[0-9]{1,3})((:[0-9]+)?)((/[a-zA-Z0-9_\-,.;=%]*)*)((\?[a-zA-Z0-9_\-,.;=&%]*)?)$
(assert (str.in_re X (re.++ (re.+ (re.union (re.range "a" "z") (re.range "A" "Z"))) (str.to_re "://") (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_") (str.to_re "-"))) (re.+ (re.union (re.++ (str.to_re ".") (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_") (str.to_re "-")))) ((_ re.loop 1 3) (re.range "0" "9")))) (str.to_re ".") (re.union ((_ re.loop 2 6) (re.union (re.range "a" "z") (re.range "A" "Z"))) ((_ re.loop 1 3) (re.range "0" "9"))) (re.opt (re.++ (str.to_re ":") (re.+ (re.range "0" "9")))) (re.* (re.++ (str.to_re "/") (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_") (str.to_re "-") (str.to_re ",") (str.to_re ".") (str.to_re ";") (str.to_re "=") (str.to_re "%"))))) (re.opt (re.++ (str.to_re "?") (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_") (str.to_re "-") (str.to_re ",") (str.to_re ".") (str.to_re ";") (str.to_re "=") (str.to_re "&") (str.to_re "%"))))) (str.to_re "\u{a}"))))
(check-sat)
