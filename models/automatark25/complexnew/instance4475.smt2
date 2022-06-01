(declare-const X String)
; 3A\d+Host\u{3A}HWAEUser-Agent\u{3A}
(assert (str.in_re X (re.++ (str.to_re "3A") (re.+ (re.range "0" "9")) (str.to_re "Host:HWAEUser-Agent:\u{a}"))))
; ^((([a-z0-9])+([\w.-]{1})?)+([^\W_]{1}))+@((([a-z0-9])+([\w-]{1})?)+([^\W_]{1}))+\.[a-z]{2,3}(\.[a-z]{2,4})?$
(assert (not (str.in_re X (re.++ (re.+ (re.++ (re.+ (re.++ (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (re.opt ((_ re.loop 1 1) (re.union (str.to_re ".") (str.to_re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_")))))) ((_ re.loop 1 1) (re.union (re.comp (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "_"))))) (str.to_re "@") (re.+ (re.++ (re.+ (re.++ (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (re.opt ((_ re.loop 1 1) (re.union (str.to_re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_")))))) ((_ re.loop 1 1) (re.union (re.comp (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "_"))))) (str.to_re ".") ((_ re.loop 2 3) (re.range "a" "z")) (re.opt (re.++ (str.to_re ".") ((_ re.loop 2 4) (re.range "a" "z")))) (str.to_re "\u{a}")))))
; /^\/[a-f0-9]{32}\/[a-f0-9]{32}\.jar$/Ui
(assert (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 32 32) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "/") ((_ re.loop 32 32) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re ".jar/Ui\u{a}"))))
; FTPHost\u{3A}User-Agent\u{3a}User\u{3A}distID=deskwizz\u{2E}com
(assert (not (str.in_re X (str.to_re "FTPHost:User-Agent:User:distID=deskwizz.com\u{a}"))))
(check-sat)
