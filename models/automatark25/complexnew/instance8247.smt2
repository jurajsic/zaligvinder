(declare-const X String)
; [a-f0-9]{8}-[a-f0-9]{4}-3[a-f0-9]{3}-[89ab][a-f0-9]{3}-[a-f0-9]{12}
(assert (not (str.in_re X (re.++ ((_ re.loop 8 8) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "-") ((_ re.loop 4 4) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "-3") ((_ re.loop 3 3) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "-") (re.union (str.to_re "8") (str.to_re "9") (str.to_re "a") (str.to_re "b")) ((_ re.loop 3 3) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "-") ((_ re.loop 12 12) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "\u{a}")))))
; User-Agent\u{3A}\w+Owner\u{3A}\w+Wordixqshv\u{2f}qzccsServer\u{0}MyBYReferer\u{3A}www\u{2E}ccnnlc\u{2E}com\u{4}\u{0}
(assert (str.in_re X (re.++ (str.to_re "User-Agent:") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "Owner:") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "Wordixqshv/qzccsServer\u{0}MyBYReferer:www.ccnnlc.com\u{13}\u{4}\u{0}\u{a}"))))
; ^(\d{4}[- ]){3}\d{4}|\d{16}$
(assert (str.in_re X (re.union (re.++ ((_ re.loop 3 3) (re.++ ((_ re.loop 4 4) (re.range "0" "9")) (re.union (str.to_re "-") (str.to_re " ")))) ((_ re.loop 4 4) (re.range "0" "9"))) (re.++ ((_ re.loop 16 16) (re.range "0" "9")) (str.to_re "\u{a}")))))
(check-sat)
