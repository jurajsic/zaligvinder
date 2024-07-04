(set-logic QF_SLIA)
(declare-const X String)
; ^(9|2{1})+([1-9]{1})+([0-9]{7})$
(assert (str.in_re X (re.++ (re.+ (re.union (str.to_re "9") ((_ re.loop 1 1) (str.to_re "2")))) (re.+ ((_ re.loop 1 1) (re.range "1" "9"))) ((_ re.loop 7 7) (re.range "0" "9")) (str.to_re "\u{a}"))))
; Information.*Firewall\s+ised2k\u{c0}STATUS\u{c0}Server
(assert (not (str.in_re X (re.++ (str.to_re "Information") (re.* re.allchar) (str.to_re "Firewall") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "ised2k\u{c0}STATUS\u{c0}Server\u{13}\u{a}")))))
(check-sat)
