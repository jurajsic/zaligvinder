(set-logic QF_SLIA)
(declare-const X String)
; \u{28}robert\u{40}blackcastlesoft\u{2E}com\u{29}
(assert (not (str.in_re X (str.to_re "(robert@blackcastlesoft.com)\u{a}"))))
; ^((19|20)\d\d)[- /.](([1-9]|[0][1-9]|1[012]))[- /.](([1-9]|[0][1-9]|1[012])|([12][0-9]|3[01]))$
(assert (not (str.in_re X (re.++ (re.union (str.to_re "-") (str.to_re " ") (str.to_re "/") (str.to_re ".")) (re.union (re.range "1" "9") (re.++ (str.to_re "0") (re.range "1" "9")) (re.++ (str.to_re "1") (re.union (str.to_re "0") (str.to_re "1") (str.to_re "2")))) (re.union (str.to_re "-") (str.to_re " ") (str.to_re "/") (str.to_re ".")) (re.union (re.range "1" "9") (re.++ (str.to_re "0") (re.range "1" "9")) (re.++ (str.to_re "1") (re.union (str.to_re "0") (str.to_re "1") (str.to_re "2"))) (re.++ (re.union (str.to_re "1") (str.to_re "2")) (re.range "0" "9")) (re.++ (str.to_re "3") (re.union (str.to_re "0") (str.to_re "1")))) (str.to_re "\u{a}") (re.union (str.to_re "19") (str.to_re "20")) (re.range "0" "9") (re.range "0" "9")))))
; ^([0-9a-fA-F][0-9a-fA-F]:){5}([0-9a-fA-F][0-9a-fA-F])$
(assert (str.in_re X (re.++ ((_ re.loop 5 5) (re.++ (re.union (re.range "0" "9") (re.range "a" "f") (re.range "A" "F")) (re.union (re.range "0" "9") (re.range "a" "f") (re.range "A" "F")) (str.to_re ":"))) (str.to_re "\u{a}") (re.union (re.range "0" "9") (re.range "a" "f") (re.range "A" "F")) (re.union (re.range "0" "9") (re.range "a" "f") (re.range "A" "F")))))
; /^\u{2f}nosignal\.jpg\?\d\.\d+$/U
(assert (str.in_re X (re.++ (str.to_re "//nosignal.jpg?") (re.range "0" "9") (str.to_re ".") (re.+ (re.range "0" "9")) (str.to_re "/U\u{a}"))))
; ([0-9a-z_-]+[\.][0-9a-z_-]{1,3})$
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") (re.+ (re.union (re.range "0" "9") (re.range "a" "z") (str.to_re "_") (str.to_re "-"))) (str.to_re ".") ((_ re.loop 1 3) (re.union (re.range "0" "9") (re.range "a" "z") (str.to_re "_") (str.to_re "-")))))))
(check-sat)
