(declare-const X String)
; [0-1]+
(assert (str.in_re X (re.++ (re.+ (re.range "0" "1")) (str.to_re "\u{a}"))))
; ^[9]9\d{10}|^[5]\d{10}
(assert (str.in_re X (re.union (re.++ (str.to_re "99") ((_ re.loop 10 10) (re.range "0" "9"))) (re.++ (str.to_re "5") ((_ re.loop 10 10) (re.range "0" "9")) (str.to_re "\u{a}")))))
; ^([a-zA-Z]+[\'\,\.\-]?[a-zA-Z ]*)+[ ]([a-zA-Z]+[\'\,\.\-]?[a-zA-Z ]+)+$
(assert (str.in_re X (re.++ (re.+ (re.++ (re.+ (re.union (re.range "a" "z") (re.range "A" "Z"))) (re.opt (re.union (str.to_re "'") (str.to_re ",") (str.to_re ".") (str.to_re "-"))) (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (str.to_re " "))))) (str.to_re " ") (re.+ (re.++ (re.+ (re.union (re.range "a" "z") (re.range "A" "Z"))) (re.opt (re.union (str.to_re "'") (str.to_re ",") (str.to_re ".") (str.to_re "-"))) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (str.to_re " "))))) (str.to_re "\u{a}"))))
; sidesearch\.dropspam\.com\s+Strip-Player
(assert (str.in_re X (re.++ (str.to_re "sidesearch.dropspam.com") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Strip-Player\u{1b}\u{a}"))))
(check-sat)
