(declare-const X String)
; ^[B|K|T|P][A-Z][0-9]{4}$
(assert (str.in_re X (re.++ (re.union (str.to_re "B") (str.to_re "|") (str.to_re "K") (str.to_re "T") (str.to_re "P")) (re.range "A" "Z") ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}"))))
(check-sat)
