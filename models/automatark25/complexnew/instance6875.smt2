(declare-const X String)
; User-Agent\u{3A}\s+Host\u{3A}[^\n\r]*Hourspjpoptwql\u{2f}rlnjFrom\u{3A}sbver\u{3a}Ghost
(assert (not (str.in_re X (re.++ (str.to_re "User-Agent:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Host:") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "Hourspjpoptwql/rlnjFrom:sbver:Ghost\u{13}\u{a}")))))
; ^(\$)?((\d+)|(\d{1,3})(\,\d{3})*)(\.\d{2,})?$
(assert (not (str.in_re X (re.++ (re.opt (str.to_re "$")) (re.union (re.+ (re.range "0" "9")) (re.++ ((_ re.loop 1 3) (re.range "0" "9")) (re.* (re.++ (str.to_re ",") ((_ re.loop 3 3) (re.range "0" "9")))))) (re.opt (re.++ (str.to_re ".") ((_ re.loop 2 2) (re.range "0" "9")) (re.* (re.range "0" "9")))) (str.to_re "\u{a}")))))
; /^\u{2f}[0-9]{4,10}$/Ui
(assert (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 4 10) (re.range "0" "9")) (str.to_re "/Ui\u{a}"))))
; 05\d{8}
(assert (str.in_re X (re.++ (str.to_re "05") ((_ re.loop 8 8) (re.range "0" "9")) (str.to_re "\u{a}"))))
; ^(20|21|22|23|[0-1]\d)[0-5]\d$
(assert (str.in_re X (re.++ (re.union (str.to_re "20") (str.to_re "21") (str.to_re "22") (str.to_re "23") (re.++ (re.range "0" "1") (re.range "0" "9"))) (re.range "0" "5") (re.range "0" "9") (str.to_re "\u{a}"))))
(check-sat)
