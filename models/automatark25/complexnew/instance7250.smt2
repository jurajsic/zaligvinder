(declare-const X String)
; gdvsotuqwsg\u{2f}dxt\.hdFrom\u{3a}hirmvtg\u{2f}ggqh\.kqh
(assert (not (str.in_re X (str.to_re "gdvsotuqwsg/dxt.hdFrom:hirmvtg/ggqh.kqh\u{1b}\u{a}"))))
; /^\/[0-9]{5}\.jar$/U
(assert (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 5 5) (re.range "0" "9")) (str.to_re ".jar/U\u{a}"))))
; ^1000([.][0]{1,3})?$|^\d{1,3}$|^\d{1,3}([.]\d{1,3})$|^([.]\d{1,3})$
(assert (str.in_re X (re.union (re.++ (str.to_re "1000") (re.opt (re.++ (str.to_re ".") ((_ re.loop 1 3) (str.to_re "0"))))) ((_ re.loop 1 3) (re.range "0" "9")) (re.++ ((_ re.loop 1 3) (re.range "0" "9")) (str.to_re ".") ((_ re.loop 1 3) (re.range "0" "9"))) (re.++ (str.to_re "\u{a}.") ((_ re.loop 1 3) (re.range "0" "9"))))))
(check-sat)
