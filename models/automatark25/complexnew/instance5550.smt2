(set-logic QF_SLIA)
(declare-const X String)
; ^([\+][0-9]{1,3}([ \.\-])?)?([\(]{1}[0-9]{3}[\)])?([0-9A-Z \.\-]{1,32})((x|ext|extension)?[0-9]{1,4}?)$
(assert (str.in_re X (re.++ (re.opt (re.++ (str.to_re "+") ((_ re.loop 1 3) (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re ".") (str.to_re "-"))))) (re.opt (re.++ ((_ re.loop 1 1) (str.to_re "(")) ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re ")"))) ((_ re.loop 1 32) (re.union (re.range "0" "9") (re.range "A" "Z") (str.to_re " ") (str.to_re ".") (str.to_re "-"))) (str.to_re "\u{a}") (re.opt (re.union (str.to_re "x") (str.to_re "ext") (str.to_re "extension"))) ((_ re.loop 1 4) (re.range "0" "9")))))
; Hourspjpoptwql\u{2f}rlnjFrom\u{3A}sbver\u{3a}Ghost
(assert (str.in_re X (str.to_re "Hourspjpoptwql/rlnjFrom:sbver:Ghost\u{13}\u{a}")))
(check-sat)
