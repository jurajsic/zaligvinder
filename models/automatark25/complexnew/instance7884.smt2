(set-logic QF_SLIA)
(declare-const X String)
; ^[2-9][0-8]\d[2-9]\d{6}$
(assert (str.in_re X (re.++ (re.range "2" "9") (re.range "0" "8") (re.range "0" "9") (re.range "2" "9") ((_ re.loop 6 6) (re.range "0" "9")) (str.to_re "\u{a}"))))
; ^[1-9]{1}[0-9]{3}\s?[a-zA-Z]{2}$
(assert (str.in_re X (re.++ ((_ re.loop 1 1) (re.range "1" "9")) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 2 2) (re.union (re.range "a" "z") (re.range "A" "Z"))) (str.to_re "\u{a}"))))
; spyblpatHost\u{3A}is\u{2E}phpBarFrom\u{3A}Host\u{3A}gdvsotuqwsg\u{2f}dxt\.hd
(assert (not (str.in_re X (str.to_re "spyblpatHost:is.phpBarFrom:Host:gdvsotuqwsg/dxt.hd\u{a}"))))
(check-sat)
