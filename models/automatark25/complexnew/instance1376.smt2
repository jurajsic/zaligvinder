(declare-const X String)
; ^([A-HK-PRSVWY][A-HJ-PR-Y])\s?([0][2-9]|[1-9][0-9])\s?[A-HJ-PR-Z]{3}$
(assert (str.in_re X (re.++ (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.union (re.++ (str.to_re "0") (re.range "2" "9")) (re.++ (re.range "1" "9") (re.range "0" "9"))) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 3 3) (re.union (re.range "A" "H") (re.range "J" "P") (re.range "R" "Z"))) (str.to_re "\u{a}") (re.union (re.range "A" "H") (re.range "K" "P") (str.to_re "R") (str.to_re "S") (str.to_re "V") (str.to_re "W") (str.to_re "Y")) (re.union (re.range "A" "H") (re.range "J" "P") (re.range "R" "Y")))))
; thesearchresltLoggerHost\u{3A}BetaHWAEHost\u{3A}is
(assert (str.in_re X (str.to_re "thesearchresltLoggerHost:BetaHWAEHost:is\u{a}")))
(check-sat)
