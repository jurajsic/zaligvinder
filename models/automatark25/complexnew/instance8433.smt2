(set-logic QF_SLIA)
(declare-const X String)
; ^(((((0?[1-9])|(1\d)|(2[0-8]))\.((0?[1-9])|(1[0-2])))|((31\.((0[13578])|(1[02])))|((29|30)\.((0?[1,3-9])|(1[0-2])))))\.((20[0-9][0-9]))|(29\.0?2\.20(([02468][048])|([13579][26]))))$
(assert (not (str.in_re X (re.++ (re.union (re.++ (re.union (re.++ (re.union (re.++ (re.opt (str.to_re "0")) (re.range "1" "9")) (re.++ (str.to_re "1") (re.range "0" "9")) (re.++ (str.to_re "2") (re.range "0" "8"))) (str.to_re ".") (re.union (re.++ (re.opt (str.to_re "0")) (re.range "1" "9")) (re.++ (str.to_re "1") (re.range "0" "2")))) (re.++ (str.to_re "31.") (re.union (re.++ (str.to_re "0") (re.union (str.to_re "1") (str.to_re "3") (str.to_re "5") (str.to_re "7") (str.to_re "8"))) (re.++ (str.to_re "1") (re.union (str.to_re "0") (str.to_re "2"))))) (re.++ (re.union (str.to_re "29") (str.to_re "30")) (str.to_re ".") (re.union (re.++ (re.opt (str.to_re "0")) (re.union (str.to_re "1") (str.to_re ",") (re.range "3" "9"))) (re.++ (str.to_re "1") (re.range "0" "2"))))) (str.to_re ".20") (re.range "0" "9") (re.range "0" "9")) (re.++ (str.to_re "29.") (re.opt (str.to_re "0")) (str.to_re "2.20") (re.union (re.++ (re.union (str.to_re "0") (str.to_re "2") (str.to_re "4") (str.to_re "6") (str.to_re "8")) (re.union (str.to_re "0") (str.to_re "4") (str.to_re "8"))) (re.++ (re.union (str.to_re "1") (str.to_re "3") (str.to_re "5") (str.to_re "7") (str.to_re "9")) (re.union (str.to_re "2") (str.to_re "6")))))) (str.to_re "\u{a}")))))
; /\u{2e}cpe([\?\u{5c}\u{2f}]|$)/smiU
(assert (str.in_re X (re.++ (str.to_re "/.cpe") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}"))))
; User-Agent\u{3A}config\u{2E}180solutions\u{2E}com
(assert (str.in_re X (str.to_re "User-Agent:config.180solutions.com\u{a}")))
(check-sat)
