(set-logic QF_SLIA)
(declare-const X String)
; Host\u{3a}[^\n\r]*pgwtjgxwthx\u{2f}byb\.xky[^\n\r]*source%3Dultrasearch136%26campaign%3Dsnap
(assert (not (str.in_re X (re.++ (str.to_re "Host:") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "pgwtjgxwthx/byb.xky") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "source%3Dultrasearch136%26campaign%3Dsnap\u{a}")))))
; \u{22}reaction\u{2E}txt\u{22}\d+sErverdist\u{2E}atlas\u{2D}ia\u{2E}comUser-Agent\u{3A}
(assert (not (str.in_re X (re.++ (str.to_re "\u{22}reaction.txt\u{22}") (re.+ (re.range "0" "9")) (str.to_re "sErverdist.atlas-ia.comUser-Agent:\u{a}")))))
; ^([1-9]{0,1})([0-9]{1})(\.[0-9])?$
(assert (not (str.in_re X (re.++ (re.opt (re.range "1" "9")) ((_ re.loop 1 1) (re.range "0" "9")) (re.opt (re.++ (str.to_re ".") (re.range "0" "9"))) (str.to_re "\u{a}")))))
; ^(\+27|27|0)[0-9]{2}( |-)?[0-9]{3}( |-)?[0-9]{4}( |-)?(x[0-9]+)?(ext[0-9]+)?
(assert (str.in_re X (re.++ (re.union (str.to_re "+27") (str.to_re "27") (str.to_re "0")) ((_ re.loop 2 2) (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "-"))) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "-"))) ((_ re.loop 4 4) (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "-"))) (re.opt (re.++ (str.to_re "x") (re.+ (re.range "0" "9")))) (re.opt (re.++ (str.to_re "ext") (re.+ (re.range "0" "9")))) (str.to_re "\u{a}"))))
(check-sat)
