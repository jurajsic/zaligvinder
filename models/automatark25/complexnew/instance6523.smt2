(declare-const X String)
; /filename=[\u{22}\u{27}]?[^\n]*\u{2e}wpd[\u{22}\u{27}\s]/si
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.opt (re.union (str.to_re "\u{22}") (str.to_re "'"))) (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".wpd") (re.union (str.to_re "\u{22}") (str.to_re "'") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "/si\u{a}")))))
; Ready\s+Eye.*http\u{3A}\u{2F}\u{2F}supremetoolbar
(assert (not (str.in_re X (re.++ (str.to_re "Ready") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Eye") (re.* re.allchar) (str.to_re "http://supremetoolbar\u{a}")))))
; (^0[78][2347][0-9]{7})
(assert (str.in_re X (re.++ (str.to_re "\u{a}0") (re.union (str.to_re "7") (str.to_re "8")) (re.union (str.to_re "2") (str.to_re "3") (str.to_re "4") (str.to_re "7")) ((_ re.loop 7 7) (re.range "0" "9")))))
; /filename=[^\n]*\u{2e}mks/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".mks/i\u{a}")))))
(check-sat)
