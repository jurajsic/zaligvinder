(set-logic QF_SLIA)
(declare-const X String)
; \.bmp[^\n\r]*couponbar\.coupons\.com.*Host\u{3A}Host\u{3a}HTTPwww
(assert (str.in_re X (re.++ (str.to_re ".bmp") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "couponbar.coupons.com") (re.* re.allchar) (str.to_re "Host:Host:HTTPwww\u{a}"))))
; ^((0[1-9])|(1[0-2]))$
(assert (not (str.in_re X (re.++ (re.union (re.++ (str.to_re "0") (re.range "1" "9")) (re.++ (str.to_re "1") (re.range "0" "2"))) (str.to_re "\u{a}")))))
; ^[a-zA-Z_]{1}[a-zA-Z0-9_]+$
(assert (str.in_re X (re.++ ((_ re.loop 1 1) (re.union (re.range "a" "z") (re.range "A" "Z") (str.to_re "_"))) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_"))) (str.to_re "\u{a}"))))
(check-sat)
