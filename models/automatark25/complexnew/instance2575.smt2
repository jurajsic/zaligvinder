(declare-const X String)
; OVN\s+\u{2A}PORT3\u{2A}\[DRIVEwww\.raxsearch\.com
(assert (not (str.in_re X (re.++ (str.to_re "OVN") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "*PORT3*[DRIVEwww.raxsearch.com\u{a}")))))
; ^[a-z0-9!$'*+\-_]+(\.[a-z0-9!$'*+\-_]+)*@([a-z0-9]+(-+[a-z0-9]+)*\.)+([a-z]{2}|aero|arpa|biz|cat|com|coop|edu|gov|info|int|jobs|mil|mobi|museum|name|net|org|pro|travel)$
(assert (str.in_re X (re.++ (re.+ (re.union (re.range "a" "z") (re.range "0" "9") (str.to_re "!") (str.to_re "$") (str.to_re "'") (str.to_re "*") (str.to_re "+") (str.to_re "-") (str.to_re "_"))) (re.* (re.++ (str.to_re ".") (re.+ (re.union (re.range "a" "z") (re.range "0" "9") (str.to_re "!") (str.to_re "$") (str.to_re "'") (str.to_re "*") (str.to_re "+") (str.to_re "-") (str.to_re "_"))))) (str.to_re "@") (re.+ (re.++ (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (re.* (re.++ (re.+ (str.to_re "-")) (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))))) (str.to_re "."))) (re.union ((_ re.loop 2 2) (re.range "a" "z")) (str.to_re "aero") (str.to_re "arpa") (str.to_re "biz") (str.to_re "cat") (str.to_re "com") (str.to_re "coop") (str.to_re "edu") (str.to_re "gov") (str.to_re "info") (str.to_re "int") (str.to_re "jobs") (str.to_re "mil") (str.to_re "mobi") (str.to_re "museum") (str.to_re "name") (str.to_re "net") (str.to_re "org") (str.to_re "pro") (str.to_re "travel")) (str.to_re "\u{a}"))))
; /^\/lists\/\d{20}$/U
(assert (not (str.in_re X (re.++ (str.to_re "//lists/") ((_ re.loop 20 20) (re.range "0" "9")) (str.to_re "/U\u{a}")))))
; Host\u{3A}\.exePass-OnHost\u{3A}\.exe\u{2F}toolbar\u{2F}
(assert (str.in_re X (str.to_re "Host:.exePass-OnHost:.exe/toolbar/\u{a}")))
; ^[SFTG]\d{7}[A-Z]$
(assert (not (str.in_re X (re.++ (re.union (str.to_re "S") (str.to_re "F") (str.to_re "T") (str.to_re "G")) ((_ re.loop 7 7) (re.range "0" "9")) (re.range "A" "Z") (str.to_re "\u{a}")))))
(check-sat)
