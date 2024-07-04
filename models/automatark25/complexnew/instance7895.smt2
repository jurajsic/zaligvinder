(set-logic QF_SLIA)
(declare-const X String)
; Word\w+My\s+\u{22}TheZC-BridgeUser-Agent\u{3A}serverUSER-Attached
(assert (str.in_re X (re.++ (str.to_re "Word") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "My") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "\u{22}TheZC-BridgeUser-Agent:serverUSER-Attached\u{a}"))))
; ^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-2]) ([0-1][0-9]|2[0-4]):([0-4][0-9]|5[0-9]):([0-4][0-9]|5[0-9])$
(assert (not (str.in_re X (re.++ ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "-") (re.union (re.++ (str.to_re "0") (re.range "1" "9")) (re.++ (str.to_re "1") (re.range "0" "2"))) (str.to_re "-") (re.union (re.++ (str.to_re "0") (re.range "1" "9")) (re.++ (re.range "1" "2") (re.range "0" "9")) (re.++ (str.to_re "3") (re.range "0" "2"))) (str.to_re " ") (re.union (re.++ (re.range "0" "1") (re.range "0" "9")) (re.++ (str.to_re "2") (re.range "0" "4"))) (str.to_re ":") (re.union (re.++ (re.range "0" "4") (re.range "0" "9")) (re.++ (str.to_re "5") (re.range "0" "9"))) (str.to_re ":") (re.union (re.++ (re.range "0" "4") (re.range "0" "9")) (re.++ (str.to_re "5") (re.range "0" "9"))) (str.to_re "\u{a}")))))
(check-sat)
