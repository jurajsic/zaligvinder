(declare-const X String)
; /filename=[^\n]*\u{2e}oga/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".oga/i\u{a}"))))
; ^((5)/(1|2|5)/([0-9])/([0-9])/([0-9])/([0-9])/([0-9])/([0-9])/([2-9]))$
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}5/") (re.union (str.to_re "1") (str.to_re "2") (str.to_re "5")) (str.to_re "/") (re.range "0" "9") (str.to_re "/") (re.range "0" "9") (str.to_re "/") (re.range "0" "9") (str.to_re "/") (re.range "0" "9") (str.to_re "/") (re.range "0" "9") (str.to_re "/") (re.range "0" "9") (str.to_re "/") (re.range "2" "9")))))
; ^((\d{8})|(\d{10})|(\d{11})|(\d{6}-\d{5}))?$
(assert (str.in_re X (re.++ (re.opt (re.union ((_ re.loop 8 8) (re.range "0" "9")) ((_ re.loop 10 10) (re.range "0" "9")) ((_ re.loop 11 11) (re.range "0" "9")) (re.++ ((_ re.loop 6 6) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 5 5) (re.range "0" "9"))))) (str.to_re "\u{a}"))))
; ^([\w-]+\.)*?[\w-]+@[\w-]+\.([\w-]+\.)*?[\w]+$
(assert (str.in_re X (re.++ (re.* (re.++ (re.+ (re.union (str.to_re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "."))) (re.+ (re.union (str.to_re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "@") (re.+ (re.union (str.to_re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re ".") (re.* (re.++ (re.+ (re.union (str.to_re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "."))) (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "\u{a}"))))
; searches\u{2E}worldtostart\u{2E}com\w+searchreslt\u{7D}\u{7B}Sysuptime\u{3A}
(assert (not (str.in_re X (re.++ (str.to_re "searches.worldtostart.com") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "searchreslt}{Sysuptime:\u{a}")))))
(check-sat)
