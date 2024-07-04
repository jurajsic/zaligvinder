(set-logic QF_SLIA)
(declare-const X String)
; /logo\.png\u{3f}(sv\u{3d}\d{1,3})?\u{26}tq\u{3d}.*?SoSEU/smiU
(assert (str.in_re X (re.++ (str.to_re "/logo.png?") (re.opt (re.++ (str.to_re "sv=") ((_ re.loop 1 3) (re.range "0" "9")))) (str.to_re "&tq=") (re.* re.allchar) (str.to_re "SoSEU/smiU\u{a}"))))
; Host\u{3A}\w+www.*ToolbartheServer\u{3A}www\u{2E}searchreslt\u{2E}com
(assert (str.in_re X (re.++ (str.to_re "Host:") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "www") (re.* re.allchar) (str.to_re "ToolbartheServer:www.searchreslt.com\u{a}"))))
; /(action|setup)=[a-z]{1,4}/Ri
(assert (not (str.in_re X (re.++ (str.to_re "/") (re.union (str.to_re "action") (str.to_re "setup")) (str.to_re "=") ((_ re.loop 1 4) (re.range "a" "z")) (str.to_re "/Ri\u{a}")))))
(check-sat)
