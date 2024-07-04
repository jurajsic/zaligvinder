(set-logic QF_SLIA)
(declare-const X String)
; /\/load_module\.php\?user\=(n1|1|2|11)$/U
(assert (str.in_re X (re.++ (str.to_re "//load_module.php?user=") (re.union (str.to_re "n1") (str.to_re "1") (str.to_re "2") (str.to_re "11")) (str.to_re "/U\u{a}"))))
; Keylogger\w+Owner\u{3A}\dBetaWordixqshv\u{2f}qzccsServer\u{0}MyBYReferer\u{3A}www\u{2E}ccnnlc\u{2E}com\u{4}\u{0}
(assert (not (str.in_re X (re.++ (str.to_re "Keylogger") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "Owner:") (re.range "0" "9") (str.to_re "BetaWordixqshv/qzccsServer\u{0}MyBYReferer:www.ccnnlc.com\u{13}\u{4}\u{0}\u{a}")))))
(check-sat)
