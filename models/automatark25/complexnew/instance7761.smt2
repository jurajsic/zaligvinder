(declare-const X String)
; /filename=[^\n]*\u{2e}asx/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".asx/i\u{a}")))))
; (^1300\d{6}$)|(^1800|1900|1902\d{6}$)|(^0[2|3|7|8]{1}[0-9]{8}$)|(^13\d{4}$)|(^04\d{2,3}\d{6}$)
(assert (not (str.in_re X (re.union (re.++ (str.to_re "1300") ((_ re.loop 6 6) (re.range "0" "9"))) (re.++ (str.to_re "0") ((_ re.loop 1 1) (re.union (str.to_re "2") (str.to_re "|") (str.to_re "3") (str.to_re "7") (str.to_re "8"))) ((_ re.loop 8 8) (re.range "0" "9"))) (re.++ (str.to_re "13") ((_ re.loop 4 4) (re.range "0" "9"))) (re.++ (str.to_re "\u{a}04") ((_ re.loop 2 3) (re.range "0" "9")) ((_ re.loop 6 6) (re.range "0" "9"))) (str.to_re "1800") (str.to_re "1900") (re.++ (str.to_re "1902") ((_ re.loop 6 6) (re.range "0" "9")))))))
; MyPostsearch\u{2e}conduit\u{2e}comUser-Agent\u{3A}AcmeSubject\u{3A}ready\.\r\n
(assert (str.in_re X (str.to_re "MyPostsearch.conduit.comUser-Agent:AcmeSubject:ready.\u{d}\u{a}\u{a}")))
; ^[\w-]+(\.[\w-]+)*@([a-z0-9-]+(\.[a-z0-9-]+)*?\.[a-z]{2,6}|(\d{1,3}\.){3}\d{1,3})(:\d{4})?$
(assert (str.in_re X (re.++ (re.+ (re.union (str.to_re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (re.* (re.++ (str.to_re ".") (re.+ (re.union (str.to_re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))))) (str.to_re "@") (re.union (re.++ (re.+ (re.union (re.range "a" "z") (re.range "0" "9") (str.to_re "-"))) (re.* (re.++ (str.to_re ".") (re.+ (re.union (re.range "a" "z") (re.range "0" "9") (str.to_re "-"))))) (str.to_re ".") ((_ re.loop 2 6) (re.range "a" "z"))) (re.++ ((_ re.loop 3 3) (re.++ ((_ re.loop 1 3) (re.range "0" "9")) (str.to_re "."))) ((_ re.loop 1 3) (re.range "0" "9")))) (re.opt (re.++ (str.to_re ":") ((_ re.loop 4 4) (re.range "0" "9")))) (str.to_re "\u{a}"))))
; show\u{2E}roogoo\u{2E}com\s+report\<\u{2F}title\>Host\u{3a}\.fcgi
(assert (str.in_re X (re.++ (str.to_re "show.roogoo.com") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "report</title>Host:.fcgi\u{a}"))))
(check-sat)
