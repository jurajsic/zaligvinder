(set-logic QF_SLIA)
(declare-const X String)
; ^([1-9]+[0-9]*|\d*[.,]\d)$
(assert (not (str.in_re X (re.++ (re.union (re.++ (re.+ (re.range "1" "9")) (re.* (re.range "0" "9"))) (re.++ (re.* (re.range "0" "9")) (re.union (str.to_re ".") (str.to_re ",")) (re.range "0" "9"))) (str.to_re "\u{a}")))))
; ^[2-9]{2}[0-9]{8}$
(assert (not (str.in_re X (re.++ ((_ re.loop 2 2) (re.range "2" "9")) ((_ re.loop 8 8) (re.range "0" "9")) (str.to_re "\u{a}")))))
; /filename=[^\n]*\u{2e}rjs/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".rjs/i\u{a}")))))
; HXLogOnlyDaemonactivityIterenetFrom\u{3A}Class
(assert (not (str.in_re X (str.to_re "HXLogOnlyDaemonactivityIterenetFrom:Class\u{a}"))))
(check-sat)
