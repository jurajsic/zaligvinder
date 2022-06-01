(declare-const X String)
; User-Agent\u{3A}uuid=aadserverfowclxccdxn\u{2f}uxwn\.ddy
(assert (not (str.in_re X (str.to_re "User-Agent:uuid=aadserverfowclxccdxn/uxwn.ddy\u{a}"))))
; (^4\d{12}$)|(^4[0-8]\d{14}$)|(^(49)[^013]\d{13}$)|(^(49030)[0-1]\d{10}$)|(^(49033)[0-4]\d{10}$)|(^(49110)[^12]\d{10}$)|(^(49117)[0-3]\d{10}$)|(^(49118)[^0-2]\d{10}$)|(^(493)[^6]\d{12}$)
(assert (not (str.in_re X (re.union (re.++ (str.to_re "4") ((_ re.loop 12 12) (re.range "0" "9"))) (re.++ (str.to_re "4") (re.range "0" "8") ((_ re.loop 14 14) (re.range "0" "9"))) (re.++ (str.to_re "49") (re.union (str.to_re "0") (str.to_re "1") (str.to_re "3")) ((_ re.loop 13 13) (re.range "0" "9"))) (re.++ (str.to_re "49030") (re.range "0" "1") ((_ re.loop 10 10) (re.range "0" "9"))) (re.++ (str.to_re "49033") (re.range "0" "4") ((_ re.loop 10 10) (re.range "0" "9"))) (re.++ (str.to_re "49110") (re.union (str.to_re "1") (str.to_re "2")) ((_ re.loop 10 10) (re.range "0" "9"))) (re.++ (str.to_re "49117") (re.range "0" "3") ((_ re.loop 10 10) (re.range "0" "9"))) (re.++ (str.to_re "49118") (re.range "0" "2") ((_ re.loop 10 10) (re.range "0" "9"))) (re.++ (str.to_re "\u{a}493") (re.comp (str.to_re "6")) ((_ re.loop 12 12) (re.range "0" "9")))))))
; Host\u{3A}\s+www\.iggsey\.comcs\u{2E}smartshopper\u{2E}com
(assert (str.in_re X (re.++ (str.to_re "Host:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "www.iggsey.comcs.smartshopper.com\u{a}"))))
; /filename=[^\n]*\u{2e}csv/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".csv/i\u{a}")))))
(check-sat)
