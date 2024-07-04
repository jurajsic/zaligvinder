(set-logic QF_SLIA)
(declare-const X String)
; ^(smtp)\.([\w\-]+)\.[\w\-]{2,3}$
(assert (not (str.in_re X (re.++ (str.to_re "smtp.") (re.+ (re.union (str.to_re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re ".") ((_ re.loop 2 3) (re.union (str.to_re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "\u{a}")))))
; encoder[^\n\r]*\.cfg\s+Host\u{3A}WeHost\u{3a}
(assert (not (str.in_re X (re.++ (str.to_re "encoder") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re ".cfg") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Host:WeHost:\u{a}")))))
; [\w!#$%&&apos;*+./=?`{|}~^-]+@[\d.A-Za-z-]+
(assert (str.in_re X (re.++ (re.+ (re.union (str.to_re "!") (str.to_re "#") (str.to_re "$") (str.to_re "%") (str.to_re "&") (str.to_re "a") (str.to_re "p") (str.to_re "o") (str.to_re "s") (str.to_re ";") (str.to_re "*") (str.to_re "+") (str.to_re ".") (str.to_re "/") (str.to_re "=") (str.to_re "?") (str.to_re "`") (str.to_re "{") (str.to_re "|") (str.to_re "}") (str.to_re "~") (str.to_re "^") (str.to_re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "@") (re.+ (re.union (re.range "0" "9") (str.to_re ".") (re.range "A" "Z") (re.range "a" "z") (str.to_re "-"))) (str.to_re "\u{a}"))))
; AdTools\d+rprpgbnrppb\u{2f}ciExplorer\u{2F}sto=notificationfindwww\u{2E}makemesearch\u{2E}com
(assert (str.in_re X (re.++ (str.to_re "AdTools") (re.+ (re.range "0" "9")) (str.to_re "rprpgbnrppb/ciExplorer/sto=notification\u{13}findwww.makemesearch.com\u{a}"))))
(check-sat)
