(declare-const X String)
; .+\.([^.]+)$
(assert (not (str.in_re X (re.++ (re.+ re.allchar) (str.to_re ".") (re.+ (re.comp (str.to_re "."))) (str.to_re "\u{a}")))))
; (^\d{9}[V|v|x|X]$)
(assert (str.in_re X (re.++ (str.to_re "\u{a}") ((_ re.loop 9 9) (re.range "0" "9")) (re.union (str.to_re "V") (str.to_re "|") (str.to_re "v") (str.to_re "x") (str.to_re "X")))))
; ^(\+{1,2}?([0-9]{2,4}|\([0-9]{2,4}\))?(-|\s)?)?[0-9]{2,3}(-|\s)?[0-9\-]{5,10}$
(assert (not (str.in_re X (re.++ (re.opt (re.++ ((_ re.loop 1 2) (str.to_re "+")) (re.opt (re.union ((_ re.loop 2 4) (re.range "0" "9")) (re.++ (str.to_re "(") ((_ re.loop 2 4) (re.range "0" "9")) (str.to_re ")")))) (re.opt (re.union (str.to_re "-") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))))) ((_ re.loop 2 3) (re.range "0" "9")) (re.opt (re.union (str.to_re "-") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 5 10) (re.union (re.range "0" "9") (str.to_re "-"))) (str.to_re "\u{a}")))))
; User-Agent\u{3A}\s+Host\u{3A}[^\n\r]*Hourspjpoptwql\u{2f}rlnjFrom\u{3A}sbver\u{3a}Ghost
(assert (not (str.in_re X (re.++ (str.to_re "User-Agent:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Host:") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "Hourspjpoptwql/rlnjFrom:sbver:Ghost\u{13}\u{a}")))))
(check-sat)
