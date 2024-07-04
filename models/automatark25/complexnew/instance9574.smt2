(set-logic QF_SLIA)
(declare-const X String)
; ((19|20)[0-9]{2})-(([1-9])|(0[1-9])|(1[0-2]))-((3[0-1])|([0-2][0-9])|([0-9]))
(assert (str.in_re X (re.++ (str.to_re "-") (re.union (re.range "1" "9") (re.++ (str.to_re "0") (re.range "1" "9")) (re.++ (str.to_re "1") (re.range "0" "2"))) (str.to_re "-") (re.union (re.++ (str.to_re "3") (re.range "0" "1")) (re.++ (re.range "0" "2") (re.range "0" "9")) (re.range "0" "9")) (str.to_re "\u{a}") (re.union (str.to_re "19") (str.to_re "20")) ((_ re.loop 2 2) (re.range "0" "9")))))
; ^(\+[1-9]\d+) ([1-9]\d+) ([1-9]\d+)(\-\d+){0,1}$|^(0\d+) ([1-9]\d+)(\-\d+){0,1}$|^([1-9]\d+)(\-\d+){0,1}$
(assert (not (str.in_re X (re.union (re.++ (str.to_re "  ") (re.opt (re.++ (str.to_re "-") (re.+ (re.range "0" "9")))) (str.to_re "+") (re.range "1" "9") (re.+ (re.range "0" "9")) (re.range "1" "9") (re.+ (re.range "0" "9")) (re.range "1" "9") (re.+ (re.range "0" "9"))) (re.++ (str.to_re " ") (re.opt (re.++ (str.to_re "-") (re.+ (re.range "0" "9")))) (str.to_re "0") (re.+ (re.range "0" "9")) (re.range "1" "9") (re.+ (re.range "0" "9"))) (re.++ (re.opt (re.++ (str.to_re "-") (re.+ (re.range "0" "9")))) (str.to_re "\u{a}") (re.range "1" "9") (re.+ (re.range "0" "9")))))))
; \u{22}reaction\u{2E}txt\u{22}User-Agent\u{3A}newsSpyAgentsmrtshpr-cs-
(assert (str.in_re X (str.to_re "\u{22}reaction.txt\u{22}User-Agent:newsSpyAgentsmrtshpr-cs-\u{13}\u{a}")))
; \u{28}robert\u{40}blackcastlesoft\u{2E}com\u{29}
(assert (not (str.in_re X (str.to_re "(robert@blackcastlesoft.com)\u{a}"))))
; /^\/[A-Za-z0-9]+\/[A-Za-z0-9]+\.php\?[A-Za-z0-9\u{2B}\u{2F}\u{3D}]{300}/Ui
(assert (not (str.in_re X (re.++ (str.to_re "//") (re.+ (re.union (re.range "A" "Z") (re.range "a" "z") (re.range "0" "9"))) (str.to_re "/") (re.+ (re.union (re.range "A" "Z") (re.range "a" "z") (re.range "0" "9"))) (str.to_re ".php?") ((_ re.loop 300 300) (re.union (re.range "A" "Z") (re.range "a" "z") (re.range "0" "9") (str.to_re "+") (str.to_re "/") (str.to_re "="))) (str.to_re "/Ui\u{a}")))))
(check-sat)
