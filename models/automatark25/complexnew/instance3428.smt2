(declare-const X String)
; ^(0?\d|1[012])\/([012]?\d|3[01])\/(\d{2}|\d{4})$
(assert (not (str.in_re X (re.++ (re.union (re.++ (re.opt (str.to_re "0")) (re.range "0" "9")) (re.++ (str.to_re "1") (re.union (str.to_re "0") (str.to_re "1") (str.to_re "2")))) (str.to_re "/") (re.union (re.++ (re.opt (re.union (str.to_re "0") (str.to_re "1") (str.to_re "2"))) (re.range "0" "9")) (re.++ (str.to_re "3") (re.union (str.to_re "0") (str.to_re "1")))) (str.to_re "/") (re.union ((_ re.loop 2 2) (re.range "0" "9")) ((_ re.loop 4 4) (re.range "0" "9"))) (str.to_re "\u{a}")))))
; Uin=encodernotification\u{2F}toolbar\u{2F}Host\u{3A}User-Agent\u{3A}
(assert (not (str.in_re X (str.to_re "Uin=encodernotification\u{13}/toolbar/Host:User-Agent:\u{a}"))))
; Last.*?(\d+.?\d*)
(assert (str.in_re X (re.++ (str.to_re "Last") (re.* re.allchar) (str.to_re "\u{a}") (re.+ (re.range "0" "9")) (re.opt re.allchar) (re.* (re.range "0" "9")))))
; ^([0-9a-fA-F]{1,2})(\s[0-9a-fA-F]{1,2})*$
(assert (str.in_re X (re.++ ((_ re.loop 1 2) (re.union (re.range "0" "9") (re.range "a" "f") (re.range "A" "F"))) (re.* (re.++ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) ((_ re.loop 1 2) (re.union (re.range "0" "9") (re.range "a" "f") (re.range "A" "F"))))) (str.to_re "\u{a}"))))
(check-sat)
