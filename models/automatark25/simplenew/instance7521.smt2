(declare-const X String)
; ^(V-|I-)?[0-9]{4}$
(assert (str.in_re X (re.++ (re.opt (re.union (str.to_re "V-") (str.to_re "I-"))) ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}"))))
(check-sat)
