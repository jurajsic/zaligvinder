(declare-const X String)
; /\/jdb\/inf\.php\?id=[a-f0-9]{32}$/Ui
(assert (str.in_re X (re.++ (str.to_re "//jdb/inf.php?id=") ((_ re.loop 32 32) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "/Ui\u{a}"))))
; M\u{2E}zip\d+dll\u{3F}\s+CodeguruBrowserwww\u{2E}sogou\u{2E}com
(assert (str.in_re X (re.++ (str.to_re "M.zip") (re.+ (re.range "0" "9")) (str.to_re "dll?") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "CodeguruBrowserwww.sogou.com\u{a}"))))
; /\u{2e}dxf([\?\u{5c}\u{2f}]|$)/smiU
(assert (not (str.in_re X (re.++ (str.to_re "/.dxf") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}")))))
; ^([0-9]{2})?((\([0-9]{2})\)|[0-9]{2})?([0-9]{3}|[0-9]{4})(\-)?[0-9]{4}$
(assert (not (str.in_re X (re.++ (re.opt ((_ re.loop 2 2) (re.range "0" "9"))) (re.opt (re.union (re.++ (str.to_re ")(") ((_ re.loop 2 2) (re.range "0" "9"))) ((_ re.loop 2 2) (re.range "0" "9")))) (re.union ((_ re.loop 3 3) (re.range "0" "9")) ((_ re.loop 4 4) (re.range "0" "9"))) (re.opt (str.to_re "-")) ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}")))))
; ^([07][1-7]|1[0-6]|2[0-7]|[35][0-9]|[468][0-8]|9[0-589])-?\d{7}$
(assert (str.in_re X (re.++ (re.union (re.++ (re.union (str.to_re "0") (str.to_re "7")) (re.range "1" "7")) (re.++ (str.to_re "1") (re.range "0" "6")) (re.++ (str.to_re "2") (re.range "0" "7")) (re.++ (re.union (str.to_re "3") (str.to_re "5")) (re.range "0" "9")) (re.++ (re.union (str.to_re "4") (str.to_re "6") (str.to_re "8")) (re.range "0" "8")) (re.++ (str.to_re "9") (re.union (re.range "0" "5") (str.to_re "8") (str.to_re "9")))) (re.opt (str.to_re "-")) ((_ re.loop 7 7) (re.range "0" "9")) (str.to_re "\u{a}"))))
(check-sat)
