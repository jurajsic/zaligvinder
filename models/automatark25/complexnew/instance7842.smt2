(set-logic QF_SLIA)
(declare-const X String)
; ^rgb\(([01]?\d\d?|2[0-4]\d|25[0-5])\,([01]?\d\d?|2[0-4]\d|25[0-5])\,([01]?\d\d?|2[0-4]\d|25[0-5])\)$ #Matches standard web rgb pattern
(assert (not (str.in_re X (re.++ (str.to_re "rgb(") (re.union (re.++ (re.opt (re.union (str.to_re "0") (str.to_re "1"))) (re.range "0" "9") (re.opt (re.range "0" "9"))) (re.++ (str.to_re "2") (re.range "0" "4") (re.range "0" "9")) (re.++ (str.to_re "25") (re.range "0" "5"))) (str.to_re ",") (re.union (re.++ (re.opt (re.union (str.to_re "0") (str.to_re "1"))) (re.range "0" "9") (re.opt (re.range "0" "9"))) (re.++ (str.to_re "2") (re.range "0" "4") (re.range "0" "9")) (re.++ (str.to_re "25") (re.range "0" "5"))) (str.to_re ",") (re.union (re.++ (re.opt (re.union (str.to_re "0") (str.to_re "1"))) (re.range "0" "9") (re.opt (re.range "0" "9"))) (re.++ (str.to_re "2") (re.range "0" "4") (re.range "0" "9")) (re.++ (str.to_re "25") (re.range "0" "5"))) (str.to_re ") #Matches standard web rgb pattern\u{a}")))))
; BY\s+\u{22}The\dUser-Agent\u{3A}serverUSER-Attached
(assert (not (str.in_re X (re.++ (str.to_re "BY") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "\u{22}The") (re.range "0" "9") (str.to_re "User-Agent:serverUSER-Attached\u{a}")))))
(check-sat)
