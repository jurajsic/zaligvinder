(declare-const X String)
; com\u{2F}index\.php\?tpid=\u{7D}\u{7B}User\u{3A}
(assert (not (str.in_re X (str.to_re "com/index.php?tpid=}{User:\u{a}"))))
; ^((0[1-9])|(1[0-2]))\/(\d{2})$
(assert (not (str.in_re X (re.++ (re.union (re.++ (str.to_re "0") (re.range "1" "9")) (re.++ (str.to_re "1") (re.range "0" "2"))) (str.to_re "/") ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "\u{a}")))))
; /^\/[-\w]{70,78}==?$/U
(assert (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 70 78) (re.union (str.to_re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "=") (re.opt (str.to_re "=")) (str.to_re "/U\u{a}"))))
; www\u{2e}2-seek\u{2e}com\u{2f}searchUser-Agent\u{3a}
(assert (not (str.in_re X (str.to_re "www.2-seek.com/searchUser-Agent:\u{a}"))))
; ^\d+(\.\d{2})?$
(assert (str.in_re X (re.++ (re.+ (re.range "0" "9")) (re.opt (re.++ (str.to_re ".") ((_ re.loop 2 2) (re.range "0" "9")))) (str.to_re "\u{a}"))))
(check-sat)
