(declare-const X String)
; dialupvpn\u{5f}pwd\d\<title\>Actual\sSpywareStrike\s+fowclxccdxn\u{2f}uxwn\.ddywww\u{2e}virusprotectpro\u{2e}com
(assert (not (str.in_re X (re.++ (str.to_re "dialupvpn_pwd") (re.range "0" "9") (str.to_re "<title>Actual") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "SpywareStrike") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "fowclxccdxn/uxwn.ddywww.virusprotectpro.com\u{a}")))))
; www\u{2E}ricercadoppia\u{2E}com\w+TPSystem\s+User-Agent\u{3A}
(assert (str.in_re X (re.++ (str.to_re "www.ricercadoppia.com") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "TPSystem") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "User-Agent:\u{a}"))))
; 32e3432ew+
(assert (not (str.in_re X (re.++ (str.to_re "32e3432e") (re.+ (str.to_re "w")) (str.to_re "\u{a}")))))
; (^(\d|,)*\.?\d*[1-9]+\d*$)|(^[1-9]+(\d|,)*\.\d*$)|(^[1-9]+(\d|,)*\d*$)
(assert (str.in_re X (re.union (re.++ (re.* (re.union (re.range "0" "9") (str.to_re ","))) (re.opt (str.to_re ".")) (re.* (re.range "0" "9")) (re.+ (re.range "1" "9")) (re.* (re.range "0" "9"))) (re.++ (re.+ (re.range "1" "9")) (re.* (re.union (re.range "0" "9") (str.to_re ","))) (str.to_re ".") (re.* (re.range "0" "9"))) (re.++ (str.to_re "\u{a}") (re.+ (re.range "1" "9")) (re.* (re.union (re.range "0" "9") (str.to_re ","))) (re.* (re.range "0" "9"))))))
; \b(([01]?\d?\d|2[0-4]\d|25[0-5])\.){3}([01]?\d?\d|2[0-4]\d|25[0-5])\b
(assert (not (str.in_re X (re.++ ((_ re.loop 3 3) (re.++ (re.union (re.++ (re.opt (re.union (str.to_re "0") (str.to_re "1"))) (re.opt (re.range "0" "9")) (re.range "0" "9")) (re.++ (str.to_re "2") (re.range "0" "4") (re.range "0" "9")) (re.++ (str.to_re "25") (re.range "0" "5"))) (str.to_re "."))) (re.union (re.++ (re.opt (re.union (str.to_re "0") (str.to_re "1"))) (re.opt (re.range "0" "9")) (re.range "0" "9")) (re.++ (str.to_re "2") (re.range "0" "4") (re.range "0" "9")) (re.++ (str.to_re "25") (re.range "0" "5"))) (str.to_re "\u{a}")))))
(check-sat)
