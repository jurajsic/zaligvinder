(set-logic QF_SLIA)
(declare-const X String)
; /ID3\u{3}\u{0}.{5}([TW][A-Z]{3}|COMM)/smi
(assert (not (str.in_re X (re.++ (str.to_re "/ID3\u{3}\u{0}") ((_ re.loop 5 5) re.allchar) (re.union (re.++ (re.union (str.to_re "T") (str.to_re "W")) ((_ re.loop 3 3) (re.range "A" "Z"))) (str.to_re "COMM")) (str.to_re "/smi\u{a}")))))
; /[a-z0-9]{32}\.jar/
(assert (not (str.in_re X (re.++ (str.to_re "/") ((_ re.loop 32 32) (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re ".jar/\u{a}")))))
; ^(([+]|00)39)?((3[1-6][0-9]))(\d{7})$
(assert (not (str.in_re X (re.++ (re.opt (re.++ (re.union (str.to_re "+") (str.to_re "00")) (str.to_re "39"))) ((_ re.loop 7 7) (re.range "0" "9")) (str.to_re "\u{a}3") (re.range "1" "6") (re.range "0" "9")))))
(check-sat)
