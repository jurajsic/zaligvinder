(declare-const X String)
; YAHOO.*Host\u{3A}.*\u{2F}cs\u{2F}pop4\u{2F}
(assert (not (str.in_re X (re.++ (str.to_re "YAHOO") (re.* re.allchar) (str.to_re "Host:") (re.* re.allchar) (str.to_re "/cs/pop4/\u{a}")))))
; rprpgbnrppb\u{2f}ci\d\u{2E}lStopperHost\u{3A}Host\u{3a}clvompycem\u{2f}cen\.vcn
(assert (not (str.in_re X (re.++ (str.to_re "rprpgbnrppb/ci") (re.range "0" "9") (str.to_re ".lStopperHost:Host:clvompycem/cen.vcn\u{a}")))))
; start\s*([^$]*)\s*(.*?)
(assert (str.in_re X (re.++ (str.to_re "start") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.* (re.comp (str.to_re "$"))) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.* re.allchar) (str.to_re "\u{a}"))))
; @{2}((\S)+)@{2}
(assert (not (str.in_re X (re.++ ((_ re.loop 2 2) (str.to_re "@")) (re.+ (re.comp (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")))) ((_ re.loop 2 2) (str.to_re "@")) (str.to_re "\u{a}")))))
; \(([0-9]{2}|0{1}((x|[0-9]){2}[0-9]{2}))\)\s*[0-9]{3,4}[- ]*[0-9]{4}
(assert (str.in_re X (re.++ (str.to_re "(") (re.union ((_ re.loop 2 2) (re.range "0" "9")) (re.++ ((_ re.loop 1 1) (str.to_re "0")) ((_ re.loop 2 2) (re.union (str.to_re "x") (re.range "0" "9"))) ((_ re.loop 2 2) (re.range "0" "9")))) (str.to_re ")") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 3 4) (re.range "0" "9")) (re.* (re.union (str.to_re "-") (str.to_re " "))) ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}"))))
(check-sat)
