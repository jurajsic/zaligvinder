(set-logic QF_SLIA)
(declare-const X String)
; User-Agent\u{3A}User-Agent\u{3A}wp-includes\u{2F}theme\u{2E}php\u{3F}frame_ver2
(assert (not (str.in_re X (str.to_re "User-Agent:User-Agent:wp-includes/theme.php?frame_ver2\u{a}"))))
; ^\([0-9]{3}\)[0-9]{3}(-)[0-9]{4}
(assert (not (str.in_re X (re.++ (str.to_re "(") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re ")") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}")))))
(check-sat)
