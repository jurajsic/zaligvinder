(declare-const X String)
; ^[3|4|5|6]([0-9]{15}$|[0-9]{12}$|[0-9]{13}$|[0-9]{14}$)
(assert (not (str.in_re X (re.++ (re.union (str.to_re "3") (str.to_re "|") (str.to_re "4") (str.to_re "5") (str.to_re "6")) (re.union ((_ re.loop 15 15) (re.range "0" "9")) ((_ re.loop 12 12) (re.range "0" "9")) ((_ re.loop 13 13) (re.range "0" "9")) ((_ re.loop 14 14) (re.range "0" "9"))) (str.to_re "\u{a}")))))
; ^((8|\+38)-?)?(\(?044\)?)?-?\d{3}-?\d{2}-?\d{2}$
(assert (str.in_re X (re.++ (re.opt (re.++ (re.union (str.to_re "8") (str.to_re "+38")) (re.opt (str.to_re "-")))) (re.opt (re.++ (re.opt (str.to_re "(")) (str.to_re "044") (re.opt (str.to_re ")")))) (re.opt (str.to_re "-")) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (str.to_re "-")) ((_ re.loop 2 2) (re.range "0" "9")) (re.opt (str.to_re "-")) ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "\u{a}"))))
; ^(.|\r|\n){1,10}$
(assert (str.in_re X (re.++ ((_ re.loop 1 10) (re.union re.allchar (str.to_re "\u{d}") (str.to_re "\u{a}"))) (str.to_re "\u{a}"))))
; ^(\d){2}-(\d){2}-(\d){2}$
(assert (not (str.in_re X (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "\u{a}")))))
; /filename=[^\n]*\u{2e}f4p/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".f4p/i\u{a}"))))
(check-sat)
