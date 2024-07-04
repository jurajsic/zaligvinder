(set-logic QF_SLIA)
(declare-const X String)
; http://www.mail-password-recovery.com/
(assert (str.in_re X (re.++ (str.to_re "http://www") re.allchar (str.to_re "mail-password-recovery") re.allchar (str.to_re "com/\u{a}"))))
; www\u{2E}weepee\u{2E}com\d+metaresults\.copernic\.com\s+
(assert (str.in_re X (re.++ (str.to_re "www.weepee.com\u{1b}") (re.+ (re.range "0" "9")) (str.to_re "metaresults.copernic.com") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "\u{a}"))))
; ^(((\(\d{3}\)|\d{3})( |-|\.))|(\(\d{3}\)|\d{3}))?\d{3}( |-|\.)?\d{4}(( |-|\.)?([Ee]xt|[Xx])[.]?( |-|\.)?\d{4})?$
(assert (not (str.in_re X (re.++ (re.opt (re.union (re.++ (re.union (re.++ (str.to_re "(") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re ")")) ((_ re.loop 3 3) (re.range "0" "9"))) (re.union (str.to_re " ") (str.to_re "-") (str.to_re "."))) (re.++ (str.to_re "(") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re ")")) ((_ re.loop 3 3) (re.range "0" "9")))) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "-") (str.to_re "."))) ((_ re.loop 4 4) (re.range "0" "9")) (re.opt (re.++ (re.opt (re.union (str.to_re " ") (str.to_re "-") (str.to_re "."))) (re.union (re.++ (re.union (str.to_re "E") (str.to_re "e")) (str.to_re "xt")) (str.to_re "X") (str.to_re "x")) (re.opt (str.to_re ".")) (re.opt (re.union (str.to_re " ") (str.to_re "-") (str.to_re "."))) ((_ re.loop 4 4) (re.range "0" "9")))) (str.to_re "\u{a}")))))
(check-sat)
