(declare-const X String)
; (^[0][2][1579]{1})(\d{6,7}$)
(assert (str.in_re X (re.++ ((_ re.loop 6 7) (re.range "0" "9")) (str.to_re "\u{a}02") ((_ re.loop 1 1) (re.union (str.to_re "1") (str.to_re "5") (str.to_re "7") (str.to_re "9"))))))
; Theef2\sHost\u{3A}\s+User-Agent\u{3a}www\u{2E}sogou\u{2E}comUser-Agent\u{3A}MyPostToolbar
(assert (str.in_re X (re.++ (str.to_re "Theef2") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "Host:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "User-Agent:www.sogou.comUser-Agent:MyPostToolbar\u{a}"))))
; ^((0*[0-1]?[0-9]{1,2}\.)|(0*((2[0-4][0-9])|(25[0-5]))\.)){3}((0*[0-1]?[0-9]{1,2})|(0*((2[0-4][0-9])|(25[0-5]))))$
(assert (str.in_re X (re.++ ((_ re.loop 3 3) (re.union (re.++ (re.* (str.to_re "0")) (re.opt (re.range "0" "1")) ((_ re.loop 1 2) (re.range "0" "9")) (str.to_re ".")) (re.++ (re.* (str.to_re "0")) (re.union (re.++ (str.to_re "2") (re.range "0" "4") (re.range "0" "9")) (re.++ (str.to_re "25") (re.range "0" "5"))) (str.to_re ".")))) (re.union (re.++ (re.* (str.to_re "0")) (re.opt (re.range "0" "1")) ((_ re.loop 1 2) (re.range "0" "9"))) (re.++ (re.* (str.to_re "0")) (re.union (re.++ (str.to_re "2") (re.range "0" "4") (re.range "0" "9")) (re.++ (str.to_re "25") (re.range "0" "5"))))) (str.to_re "\u{a}"))))
; /\u{2e}pct([\?\u{5c}\u{2f}]|$)/smiU
(assert (str.in_re X (re.++ (str.to_re "/.pct") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}"))))
(check-sat)
