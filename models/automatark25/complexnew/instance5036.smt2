(set-logic QF_SLIA)
(declare-const X String)
; \.icosearch\u{2e}conduit\u{2e}com\u{3C}logs\u{40}logs\u{2E}com\u{3E}
(assert (not (str.in_re X (str.to_re ".icosearch.conduit.com<logs@logs.com>\u{a}"))))
; [0-9]{3}P[A-Z][0-9]{7}[0-9X]
(assert (str.in_re X (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "P") (re.range "A" "Z") ((_ re.loop 7 7) (re.range "0" "9")) (re.union (re.range "0" "9") (str.to_re "X")) (str.to_re "\u{a}"))))
(check-sat)
