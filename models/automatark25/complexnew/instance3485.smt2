(set-logic QF_SLIA)
(declare-const X String)
; <a[a-zA-Z0-9 ="'.:;?]*(name=){1}[a-zA-Z0-9 ="'.:;?]*\s*((/>)|(>[a-zA-Z0-9 ="'<>.:;?]*</a>))
(assert (not (str.in_re X (re.++ (str.to_re "<a") (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re " ") (str.to_re "=") (str.to_re "\u{22}") (str.to_re "'") (str.to_re ".") (str.to_re ":") (str.to_re ";") (str.to_re "?"))) ((_ re.loop 1 1) (str.to_re "name=")) (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re " ") (str.to_re "=") (str.to_re "\u{22}") (str.to_re "'") (str.to_re ".") (str.to_re ":") (str.to_re ";") (str.to_re "?"))) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.union (str.to_re "/>") (re.++ (str.to_re ">") (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re " ") (str.to_re "=") (str.to_re "\u{22}") (str.to_re "'") (str.to_re "<") (str.to_re ">") (str.to_re ".") (str.to_re ":") (str.to_re ";") (str.to_re "?"))) (str.to_re "</a>"))) (str.to_re "\u{a}")))))
; ^(\+27|27)?(\()?0?([7][1-9]|[8][2-4])(\))?( |-|\.|_)?(\d{3})( |-|\.|_)?(\d{4})
(assert (str.in_re X (re.++ (re.opt (re.union (str.to_re "+27") (str.to_re "27"))) (re.opt (str.to_re "(")) (re.opt (str.to_re "0")) (re.union (re.++ (str.to_re "7") (re.range "1" "9")) (re.++ (str.to_re "8") (re.range "2" "4"))) (re.opt (str.to_re ")")) (re.opt (re.union (str.to_re " ") (str.to_re "-") (str.to_re ".") (str.to_re "_"))) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "-") (str.to_re ".") (str.to_re "_"))) ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}"))))
; to=.*JMail\d+HXDownloadasdbiz\u{2E}bizUser-Agent\u{3A}www\u{2E}ezula\u{2E}com
(assert (not (str.in_re X (re.++ (str.to_re "to=") (re.* re.allchar) (str.to_re "JMail") (re.+ (re.range "0" "9")) (str.to_re "HXDownloadasdbiz.bizUser-Agent:www.ezula.com\u{a}")))))
; ^[A-Z]{1}-[0-9]{7}$
(assert (str.in_re X (re.++ ((_ re.loop 1 1) (re.range "A" "Z")) (str.to_re "-") ((_ re.loop 7 7) (re.range "0" "9")) (str.to_re "\u{a}"))))
(check-sat)
