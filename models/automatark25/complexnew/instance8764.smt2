(set-logic QF_SLIA)
(declare-const X String)
; /name\u{3d}screenshot\d+\u{2e}/i
(assert (str.in_re X (re.++ (str.to_re "/name=screenshot") (re.+ (re.range "0" "9")) (str.to_re "./i\u{a}"))))
; \$(\d*)??,??(\d*)??,??(\d*)\.(\d*)
(assert (not (str.in_re X (re.++ (str.to_re "$") (re.opt (re.* (re.range "0" "9"))) (re.opt (str.to_re ",")) (re.opt (re.* (re.range "0" "9"))) (re.opt (str.to_re ",")) (re.* (re.range "0" "9")) (str.to_re ".") (re.* (re.range "0" "9")) (str.to_re "\u{a}")))))
; /MODE\sd?u?n?\u{7b}[AU]\u{5c}[LD]\u{5c}(86|64)\u{5c}\w{0,8}\u{5c}\w{2,16}\u{7d}[a-z]{8}\s\u{2B}piwksT\u{2D}x\u{D}\u{A}/i
(assert (not (str.in_re X (re.++ (str.to_re "/MODE") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (re.opt (str.to_re "d")) (re.opt (str.to_re "u")) (re.opt (str.to_re "n")) (str.to_re "{") (re.union (str.to_re "A") (str.to_re "U")) (str.to_re "\u{5c}") (re.union (str.to_re "L") (str.to_re "D")) (str.to_re "\u{5c}") (re.union (str.to_re "86") (str.to_re "64")) (str.to_re "\u{5c}") ((_ re.loop 0 8) (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "\u{5c}") ((_ re.loop 2 16) (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "}") ((_ re.loop 8 8) (re.range "a" "z")) (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "+piwksT-x\u{d}\u{a}/i\u{a}")))))
(check-sat)
