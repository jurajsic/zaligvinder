(declare-const X String)
; /encoding\u{3D}[\u{22}\u{27}][^\u{22}\u{27}]{1024}/
(assert (str.in_re X (re.++ (str.to_re "/encoding=") (re.union (str.to_re "\u{22}") (str.to_re "'")) ((_ re.loop 1024 1024) (re.union (str.to_re "\u{22}") (str.to_re "'"))) (str.to_re "/\u{a}"))))
; ^[SC]{2}[0-9]{6}$
(assert (str.in_re X (re.++ ((_ re.loop 2 2) (re.union (str.to_re "S") (str.to_re "C"))) ((_ re.loop 6 6) (re.range "0" "9")) (str.to_re "\u{a}"))))
; IDENTIFY.*\/cgi-bin\/PopupV.*Host\u{3A}searchreslt
(assert (not (str.in_re X (re.++ (str.to_re "IDENTIFY") (re.* re.allchar) (str.to_re "/cgi-bin/PopupV") (re.* re.allchar) (str.to_re "Host:searchreslt\u{a}")))))
; [({]?(0x)?[0-9a-fA-F]{8}([-,]?(0x)?[0-9a-fA-F]{4}){2}((-?[0-9a-fA-F]{4}-?[0-9a-fA-F]{12})|(,\{0x[0-9a-fA-F]{2}(,0x[0-9a-fA-F]{2}){7}\}))[)}]?
(assert (not (str.in_re X (re.++ (re.opt (re.union (str.to_re "(") (str.to_re "{"))) (re.opt (str.to_re "0x")) ((_ re.loop 8 8) (re.union (re.range "0" "9") (re.range "a" "f") (re.range "A" "F"))) ((_ re.loop 2 2) (re.++ (re.opt (re.union (str.to_re "-") (str.to_re ","))) (re.opt (str.to_re "0x")) ((_ re.loop 4 4) (re.union (re.range "0" "9") (re.range "a" "f") (re.range "A" "F"))))) (re.union (re.++ (re.opt (str.to_re "-")) ((_ re.loop 4 4) (re.union (re.range "0" "9") (re.range "a" "f") (re.range "A" "F"))) (re.opt (str.to_re "-")) ((_ re.loop 12 12) (re.union (re.range "0" "9") (re.range "a" "f") (re.range "A" "F")))) (re.++ (str.to_re ",{0x") ((_ re.loop 2 2) (re.union (re.range "0" "9") (re.range "a" "f") (re.range "A" "F"))) ((_ re.loop 7 7) (re.++ (str.to_re ",0x") ((_ re.loop 2 2) (re.union (re.range "0" "9") (re.range "a" "f") (re.range "A" "F"))))) (str.to_re "}"))) (re.opt (re.union (str.to_re ")") (str.to_re "}"))) (str.to_re "\u{a}")))))
; ^([^ \u{21}-\u{26}\u{28}-\u{2C}\u{2E}-\u{40}\u{5B}-\u{60}\u{7B}-\u{AC}\u{AE}-\u{BF}\u{F7}\u{FE}]+)$
(assert (str.in_re X (re.++ (re.+ (re.union (str.to_re " ") (re.range "!" "&") (re.range "(" ",") (re.range "." "@") (re.range "[" "`") (re.range "{" "\u{ac}") (re.range "\u{ae}" "\u{bf}") (str.to_re "\u{f7}") (str.to_re "\u{fe}"))) (str.to_re "\u{a}"))))
(check-sat)
