(declare-const X String)
; /filename=[^\n]*\u{2e}quo/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".quo/i\u{a}")))))
; ^[0,1]?\d{1}\/(([0-2]?\d{1})|([3][0,1]{1}))\/(([1]{1}[9]{1}[9]{1}\d{1})|([2-9]{1}\d{3}))$
(assert (not (str.in_re X (re.++ (re.opt (re.union (str.to_re "0") (str.to_re ",") (str.to_re "1"))) ((_ re.loop 1 1) (re.range "0" "9")) (str.to_re "/") (re.union (re.++ (re.opt (re.range "0" "2")) ((_ re.loop 1 1) (re.range "0" "9"))) (re.++ (str.to_re "3") ((_ re.loop 1 1) (re.union (str.to_re "0") (str.to_re ",") (str.to_re "1"))))) (str.to_re "/") (re.union (re.++ ((_ re.loop 1 1) (str.to_re "1")) ((_ re.loop 1 1) (str.to_re "9")) ((_ re.loop 1 1) (str.to_re "9")) ((_ re.loop 1 1) (re.range "0" "9"))) (re.++ ((_ re.loop 1 1) (re.range "2" "9")) ((_ re.loop 3 3) (re.range "0" "9")))) (str.to_re "\u{a}")))))
; /filename=[^\n]*\u{2e}plf/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".plf/i\u{a}"))))
(check-sat)
