(set-logic QF_SLIA)
(declare-const X String)
; NSIS_DOWNLOAD.*User-Agent\u{3A}\s+gpstool\u{2e}globaladserver\u{2e}com
(assert (str.in_re X (re.++ (str.to_re "NSIS_DOWNLOAD") (re.* re.allchar) (str.to_re "User-Agent:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "gpstool.globaladserver.com\u{a}"))))
; (^(2014)|^(2149))\d{11}$
(assert (not (str.in_re X (re.++ (re.union (str.to_re "2014") (str.to_re "2149")) ((_ re.loop 11 11) (re.range "0" "9")) (str.to_re "\u{a}")))))
; ^[0-2]?[1-9]{1}$|^3{1}[01]{1}$
(assert (not (str.in_re X (re.union (re.++ (re.opt (re.range "0" "2")) ((_ re.loop 1 1) (re.range "1" "9"))) (re.++ ((_ re.loop 1 1) (str.to_re "3")) ((_ re.loop 1 1) (re.union (str.to_re "0") (str.to_re "1"))) (str.to_re "\u{a}"))))))
; ^(NAME)(\s?)<?(\w*)(\s*)([0-9]*)>?$
(assert (str.in_re X (re.++ (str.to_re "NAME") (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.opt (str.to_re "<")) (re.* (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.* (re.range "0" "9")) (re.opt (str.to_re ">")) (str.to_re "\u{a}"))))
(check-sat)
