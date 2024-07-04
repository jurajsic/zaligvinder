(set-logic QF_SLIA)
(declare-const X String)
; searches\u{2E}worldtostart\u{2E}com\w+searchreslt\u{7D}\u{7B}Sysuptime\u{3A}
(assert (str.in_re X (re.++ (str.to_re "searches.worldtostart.com") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "searchreslt}{Sysuptime:\u{a}"))))
; ^[a-zA-Z]{4}[a-zA-Z]{2}[a-zA-Z0-9]{2}[XXX0-9]{0,3}
(assert (str.in_re X (re.++ ((_ re.loop 4 4) (re.union (re.range "a" "z") (re.range "A" "Z"))) ((_ re.loop 2 2) (re.union (re.range "a" "z") (re.range "A" "Z"))) ((_ re.loop 2 2) (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9"))) ((_ re.loop 0 3) (re.union (str.to_re "X") (re.range "0" "9"))) (str.to_re "\u{a}"))))
; %3fSupremeSoftwareoffers\u{2E}bullseye-network\u{2E}com
(assert (not (str.in_re X (str.to_re "%3fSupremeSoftwareoffers.bullseye-network.com\u{a}"))))
; /^(([01]?\d?\d|2[0-4]\d|25[0-5])\.){3}([01]?\d?\d|2[0-4]\d|25[0-5])\/(\d{1}|[0-2]{1}\d{1}|3[0-2])$/
(assert (str.in_re X (re.++ (str.to_re "/") ((_ re.loop 3 3) (re.++ (re.union (re.++ (re.opt (re.union (str.to_re "0") (str.to_re "1"))) (re.opt (re.range "0" "9")) (re.range "0" "9")) (re.++ (str.to_re "2") (re.range "0" "4") (re.range "0" "9")) (re.++ (str.to_re "25") (re.range "0" "5"))) (str.to_re "."))) (re.union (re.++ (re.opt (re.union (str.to_re "0") (str.to_re "1"))) (re.opt (re.range "0" "9")) (re.range "0" "9")) (re.++ (str.to_re "2") (re.range "0" "4") (re.range "0" "9")) (re.++ (str.to_re "25") (re.range "0" "5"))) (str.to_re "/") (re.union ((_ re.loop 1 1) (re.range "0" "9")) (re.++ ((_ re.loop 1 1) (re.range "0" "2")) ((_ re.loop 1 1) (re.range "0" "9"))) (re.++ (str.to_re "3") (re.range "0" "2"))) (str.to_re "/\u{a}"))))
; /^\/[0-9]{8}\.html$/U
(assert (not (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 8 8) (re.range "0" "9")) (str.to_re ".html/U\u{a}")))))
(check-sat)
