(declare-const X String)
; Searchdata2\.activshopper\.comdll\u{3F}productsCUSTOMSAccwww\u{2E}locators\u{2E}com
(assert (not (str.in_re X (str.to_re "Searchdata2.activshopper.comdll?productsCUSTOMSAccwww.locators.com\u{a}"))))
; ^([4]{1})([0-9]{12,15})$
(assert (str.in_re X (re.++ ((_ re.loop 1 1) (str.to_re "4")) ((_ re.loop 12 15) (re.range "0" "9")) (str.to_re "\u{a}"))))
; /^GET\s\u{2f}[A-F0-9]{152}/m
(assert (str.in_re X (re.++ (str.to_re "/GET") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "/") ((_ re.loop 152 152) (re.union (re.range "A" "F") (re.range "0" "9"))) (str.to_re "/m\u{a}"))))
(check-sat)
