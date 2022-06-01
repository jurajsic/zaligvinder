(declare-const X String)
; [cC]{1}[0-9]{0,7}
(assert (str.in_re X (re.++ ((_ re.loop 1 1) (re.union (str.to_re "c") (str.to_re "C"))) ((_ re.loop 0 7) (re.range "0" "9")) (str.to_re "\u{a}"))))
; \\s\\d{2}[-]\\w{3}-\\d{4}
(assert (str.in_re X (re.++ (str.to_re "\u{5c}s\u{5c}") ((_ re.loop 2 2) (str.to_re "d")) (str.to_re "-\u{5c}") ((_ re.loop 3 3) (str.to_re "w")) (str.to_re "-\u{5c}") ((_ re.loop 4 4) (str.to_re "d")) (str.to_re "\u{a}"))))
; activityHWAEHost\u{3a}MyWayServidor\u{2E}HANDYEmail
(assert (not (str.in_re X (str.to_re "activityHWAEHost:MyWayServidor.\u{13}HANDYEmail\u{a}"))))
(check-sat)
