(set-logic QF_SLIA)
(declare-const X String)
; ^([0-9]|[1-9][0-9]|[1-9][0-9][0-9])$
(assert (str.in_re X (re.++ (re.union (re.range "0" "9") (re.++ (re.range "1" "9") (re.range "0" "9")) (re.++ (re.range "1" "9") (re.range "0" "9") (re.range "0" "9"))) (str.to_re "\u{a}"))))
; BY\u{7D}\u{7B}User\u{3A}Host\u{3A}connection\u{2E}
(assert (str.in_re X (str.to_re "BY}{User:Host:connection.\u{a}")))
; ^(smtp)\.([\w\-]+)\.[\w\-]{2,3}$
(assert (str.in_re X (re.++ (str.to_re "smtp.") (re.+ (re.union (str.to_re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re ".") ((_ re.loop 2 3) (re.union (str.to_re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "\u{a}"))))
; /http:\\/\/\.?video.google.\w{2,3}\/videoplay\?docid=([a-z0-9-_]+)/i
(assert (not (str.in_re X (re.++ (str.to_re "/http:\u{5c}//") (re.opt (str.to_re ".")) (str.to_re "video") re.allchar (str.to_re "google") re.allchar ((_ re.loop 2 3) (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "/videoplay?docid=") (re.+ (re.union (re.range "a" "z") (re.range "0" "9") (str.to_re "-") (str.to_re "_"))) (str.to_re "/i\u{a}")))))
(check-sat)
