(set-logic QF_SLIA)
(declare-const X String)
; couponbar\.coupons\.com\dOwner\u{3A}\s+Host\u{3A}
(assert (not (str.in_re X (re.++ (str.to_re "couponbar.coupons.com") (re.range "0" "9") (str.to_re "Owner:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Host:\u{a}")))))
; Validation of Mexican RFC for tax payers (individuals)
(assert (str.in_re X (str.to_re "Validation of Mexican RFC for tax payers individuals\u{a}")))
(check-sat)
