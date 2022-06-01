(declare-const X String)
; ^([0-9a-fA-F]{4}|0)(\:([0-9a-fA-F]{4}|0)){7}$
(assert (not (str.in_re X (re.++ (re.union ((_ re.loop 4 4) (re.union (re.range "0" "9") (re.range "a" "f") (re.range "A" "F"))) (str.to_re "0")) ((_ re.loop 7 7) (re.++ (str.to_re ":") (re.union ((_ re.loop 4 4) (re.union (re.range "0" "9") (re.range "a" "f") (re.range "A" "F"))) (str.to_re "0")))) (str.to_re "\u{a}")))))
; /filename=[^\n]*\u{2e}tif/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".tif/i\u{a}")))))
; ^[S-s]( |-)?[1-9]{1}[0-9]{2}( |-)?[0-9]{2}$
(assert (not (str.in_re X (re.++ (re.range "S" "s") (re.opt (re.union (str.to_re " ") (str.to_re "-"))) ((_ re.loop 1 1) (re.range "1" "9")) ((_ re.loop 2 2) (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "-"))) ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "\u{a}")))))
; t=[^\n\r]*Host\u{3A}\s+Basicaohobygi\u{2f}zwiw
(assert (not (str.in_re X (re.++ (str.to_re "t=") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "Host:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Basicaohobygi/zwiw\u{a}")))))
(check-sat)
