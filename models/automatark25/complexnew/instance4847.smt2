(declare-const X String)
; media\u{2E}dxcdirect\u{2E}com\.smx\?PASSW=SAHHost\u{3A}ProAgentIDENTIFY
(assert (not (str.in_re X (str.to_re "media.dxcdirect.com.smx?PASSW=SAHHost:ProAgentIDENTIFY\u{a}"))))
; Project\u{2E}earthlinkshprrprt-cs-
(assert (str.in_re X (str.to_re "Project.earthlinkshprrprt-cs-\u{13}\u{a}")))
; ^([a-zA-Z]+(.)?[\s]*)$
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") (re.+ (re.union (re.range "a" "z") (re.range "A" "Z"))) (re.opt re.allchar) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")))))))
; ^1?[1-9]$|^[1-2]0$
(assert (str.in_re X (re.union (re.++ (re.opt (str.to_re "1")) (re.range "1" "9")) (re.++ (re.range "1" "2") (str.to_re "0\u{a}")))))
; ^([A-Z]{3}\s?(\d{3}|\d{2}|d{1})\s?[A-Z])|([A-Z]\s?(\d{3}|\d{2}|\d{1})\s?[A-Z]{3})$
(assert (not (str.in_re X (re.union (re.++ ((_ re.loop 3 3) (re.range "A" "Z")) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.union ((_ re.loop 3 3) (re.range "0" "9")) ((_ re.loop 2 2) (re.range "0" "9")) ((_ re.loop 1 1) (str.to_re "d"))) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.range "A" "Z")) (re.++ (str.to_re "\u{a}") (re.range "A" "Z") (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.union ((_ re.loop 3 3) (re.range "0" "9")) ((_ re.loop 2 2) (re.range "0" "9")) ((_ re.loop 1 1) (re.range "0" "9"))) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 3 3) (re.range "A" "Z")))))))
(check-sat)
