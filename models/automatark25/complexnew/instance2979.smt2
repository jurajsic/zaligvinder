(set-logic QF_SLIA)
(declare-const X String)
; /[^\u{20}-\u{7e}\u{d}\u{a}]{4}/P
(assert (not (str.in_re X (re.++ (str.to_re "/") ((_ re.loop 4 4) (re.union (re.range " " "~") (str.to_re "\u{d}") (str.to_re "\u{a}"))) (str.to_re "/P\u{a}")))))
; replace(MobileNo,' ',''),'^(\+44|0044|0)(7)[4-9][0-9]{8}$'
(assert (not (str.in_re X (re.++ (str.to_re "replaceMobileNo,' ','','") (re.union (str.to_re "+44") (str.to_re "0044") (str.to_re "0")) (str.to_re "7") (re.range "4" "9") ((_ re.loop 8 8) (re.range "0" "9")) (str.to_re "'\u{a}")))))
(check-sat)
