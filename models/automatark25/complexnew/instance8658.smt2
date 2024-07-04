(set-logic QF_SLIA)
(declare-const X String)
; to=.*JMail\d+HXDownloadasdbiz\u{2E}bizUser-Agent\u{3A}www\u{2E}ezula\u{2E}com
(assert (not (str.in_re X (re.++ (str.to_re "to=") (re.* re.allchar) (str.to_re "JMail") (re.+ (re.range "0" "9")) (str.to_re "HXDownloadasdbiz.bizUser-Agent:www.ezula.com\u{a}")))))
; /\u{2e}jpeg([\?\u{5c}\u{2f}]|$)/smiU
(assert (str.in_re X (re.++ (str.to_re "/.jpeg") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}"))))
; /^[a-z][\w\.]+@([\w\-]+\.)+[a-z]{2,7}$/i
(assert (not (str.in_re X (re.++ (str.to_re "/") (re.range "a" "z") (re.+ (re.union (str.to_re ".") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "@") (re.+ (re.++ (re.+ (re.union (str.to_re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "."))) ((_ re.loop 2 7) (re.range "a" "z")) (str.to_re "/i\u{a}")))))
; /\u{2f}ib2\u{2f}$/U
(assert (not (str.in_re X (str.to_re "//ib2//U\u{a}"))))
(check-sat)
