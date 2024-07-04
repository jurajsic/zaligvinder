(set-logic QF_SLIA)
(declare-const X String)
; ^\d*(\.\d*)$
(assert (not (str.in_re X (re.++ (re.* (re.range "0" "9")) (str.to_re "\u{a}.") (re.* (re.range "0" "9"))))))
; /filename=[^\n]*\u{2e}ses/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".ses/i\u{a}")))))
; jquery\-(\d|\.)*\.min\.js
(assert (str.in_re X (re.++ (str.to_re "jquery-") (re.* (re.union (re.range "0" "9") (str.to_re "."))) (str.to_re ".min.js\u{a}"))))
; /filename=[^\n]*\u{2e}pfb/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".pfb/i\u{a}"))))
; ^-?[0-9]\d{0,8}(\.\d{1,4})
(assert (str.in_re X (re.++ (re.opt (str.to_re "-")) (re.range "0" "9") ((_ re.loop 0 8) (re.range "0" "9")) (str.to_re "\u{a}.") ((_ re.loop 1 4) (re.range "0" "9")))))
(check-sat)
