(set-logic QF_SLIA)
(declare-const X String)
; hirmvtg\u{2f}ggqh\.kqh\d+sports\w+whenu\u{2E}comwp-includes\u{2F}feed\u{2E}php\u{3F}
(assert (not (str.in_re X (re.++ (str.to_re "hirmvtg/ggqh.kqh\u{1b}") (re.+ (re.range "0" "9")) (str.to_re "sports") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "whenu.com\u{13}wp-includes/feed.php?\u{a}")))))
(check-sat)
