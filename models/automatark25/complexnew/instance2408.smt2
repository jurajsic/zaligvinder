(set-logic QF_SLIA)
(declare-const X String)
; GmbH\d+Host\u{3A}\w+adblock\u{2E}linkz\u{2E}comUser-Agent\u{3A}email
(assert (str.in_re X (re.++ (str.to_re "GmbH") (re.+ (re.range "0" "9")) (str.to_re "Host:") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "adblock.linkz.comUser-Agent:email\u{a}"))))
; ^09(73|74|05|06|15|16|17|26|27|35|36|37|79|38|07|08|09|10|12|18|19|20|21|28|29|30|38|39|89|99|22|23|32|33)\d{3}\s?\d{4}
(assert (str.in_re X (re.++ (str.to_re "09") (re.union (str.to_re "73") (str.to_re "74") (str.to_re "05") (str.to_re "06") (str.to_re "15") (str.to_re "16") (str.to_re "17") (str.to_re "26") (str.to_re "27") (str.to_re "35") (str.to_re "36") (str.to_re "37") (str.to_re "79") (str.to_re "38") (str.to_re "07") (str.to_re "08") (str.to_re "09") (str.to_re "10") (str.to_re "12") (str.to_re "18") (str.to_re "19") (str.to_re "20") (str.to_re "21") (str.to_re "28") (str.to_re "29") (str.to_re "30") (str.to_re "38") (str.to_re "39") (str.to_re "89") (str.to_re "99") (str.to_re "22") (str.to_re "23") (str.to_re "32") (str.to_re "33")) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}"))))
; Ts2\u{2F}\s+insertinfoSnakeUser-Agent\u{3A}
(assert (str.in_re X (re.++ (str.to_re "Ts2/") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "insertinfoSnakeUser-Agent:\u{a}"))))
; X-OSSproxy\u{3a}\dMicrosoft\u{2A}PORT3\u{2A}ProLive\+Version\+3A
(assert (not (str.in_re X (re.++ (str.to_re "X-OSSproxy:") (re.range "0" "9") (str.to_re "Microsoft*PORT3*ProLive+Version+3A\u{a}")))))
; www\u{2E}ZSearchResults\u{2E}com\dBar.*sponsor2\.ucmore\.com
(assert (not (str.in_re X (re.++ (str.to_re "www.ZSearchResults.com\u{13}") (re.range "0" "9") (str.to_re "Bar") (re.* re.allchar) (str.to_re "sponsor2.ucmore.com\u{a}")))))
(check-sat)
