(declare-const X String)
; /filename=[^\n]*\u{2e}p2g/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".p2g/i\u{a}"))))
; www\u{2E}eblocs\u{2E}comcorep\u{2E}dmcast\u{2E}com
(assert (str.in_re X (str.to_re "www.eblocs.com\u{1b}corep.dmcast.com\u{a}")))
; /filename=[^\n]*\u{2e}asx/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".asx/i\u{a}")))))
; (^3[47])((\d{11}$)|(\d{13}$))
(assert (not (str.in_re X (re.++ (re.union ((_ re.loop 11 11) (re.range "0" "9")) ((_ re.loop 13 13) (re.range "0" "9"))) (str.to_re "\u{a}3") (re.union (str.to_re "4") (str.to_re "7"))))))
(check-sat)
