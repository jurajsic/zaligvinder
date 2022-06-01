(declare-const X String)
; Pattern that matches all DVLA Vehicle Registration Marks (VRM). Allows for an optional single space between segments.
(assert (str.in_re X (re.++ (str.to_re "Pattern that matches all DVLA Vehicle Registration Marks VRM") re.allchar (str.to_re " Allows for an optional single space between segments") re.allchar (str.to_re "\u{a}"))))
; ^((\+989)|(989)|(00989)|(09|9))([1|2|3][0-9]\d{7}$)
(assert (not (str.in_re X (re.++ (re.union (str.to_re "+989") (str.to_re "989") (str.to_re "00989") (str.to_re "09") (str.to_re "9")) (str.to_re "\u{a}") (re.union (str.to_re "1") (str.to_re "|") (str.to_re "2") (str.to_re "3")) (re.range "0" "9") ((_ re.loop 7 7) (re.range "0" "9"))))))
; Host\u{3A}\s+www\u{2E}webfringe\u{2E}com\d+Version\d\u{2E}lSpywww\u{2E}lookquick\u{2E}comSubject\u{3A}\u{3a}\u{29}\r\n
(assert (not (str.in_re X (re.++ (str.to_re "Host:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "www.webfringe.com") (re.+ (re.range "0" "9")) (str.to_re "Version") (re.range "0" "9") (str.to_re ".lSpywww.lookquick.comSubject::)\u{d}\u{a}\u{13}\u{a}")))))
; /^slowhttp\u{7c}\d+\u{7c}\d+\u{7C}[a-z0-9]+\u{2E}[a-z]{2,3}\u{7C}[a-z0-9]+\u{7C}/
(assert (str.in_re X (re.++ (str.to_re "/slowhttp|") (re.+ (re.range "0" "9")) (str.to_re "|") (re.+ (re.range "0" "9")) (str.to_re "|") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re ".") ((_ re.loop 2 3) (re.range "a" "z")) (str.to_re "|") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re "|/\u{a}"))))
; /\u{2F}mrow\u{5F}pin\u{2F}\u{3F}id\d+[a-z]{5,}\d{5}\u{26}rnd\u{3D}\d+/smi
(assert (not (str.in_re X (re.++ (str.to_re "//mrow_pin/?id") (re.+ (re.range "0" "9")) ((_ re.loop 5 5) (re.range "0" "9")) (str.to_re "&rnd=") (re.+ (re.range "0" "9")) (str.to_re "/smi\u{a}") ((_ re.loop 5 5) (re.range "a" "z")) (re.* (re.range "a" "z"))))))
(check-sat)
