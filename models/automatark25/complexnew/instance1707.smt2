(set-logic QF_SLIA)
(declare-const X String)
; (^1300\d{6}$)|(^1800|1900|1902\d{6}$)|(^0[2|3|7|8]{1}[0-9]{8}$)|(^13\d{4}$)|(^04\d{2,3}\d{6}$)
(assert (str.in_re X (re.union (re.++ (str.to_re "1300") ((_ re.loop 6 6) (re.range "0" "9"))) (re.++ (str.to_re "0") ((_ re.loop 1 1) (re.union (str.to_re "2") (str.to_re "|") (str.to_re "3") (str.to_re "7") (str.to_re "8"))) ((_ re.loop 8 8) (re.range "0" "9"))) (re.++ (str.to_re "13") ((_ re.loop 4 4) (re.range "0" "9"))) (re.++ (str.to_re "\u{a}04") ((_ re.loop 2 3) (re.range "0" "9")) ((_ re.loop 6 6) (re.range "0" "9"))) (str.to_re "1800") (str.to_re "1900") (re.++ (str.to_re "1902") ((_ re.loop 6 6) (re.range "0" "9"))))))
; ^[a-z][a-z0-9\.,\-_]{5,31}$
(assert (str.in_re X (re.++ (re.range "a" "z") ((_ re.loop 5 31) (re.union (re.range "a" "z") (re.range "0" "9") (str.to_re ".") (str.to_re ",") (str.to_re "-") (str.to_re "_"))) (str.to_re "\u{a}"))))
; (^[0-9]{2,3}\.[0-9]{3}\.[0-9]{3}\/[0-9]{4}-[0-9]{2}$)
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") ((_ re.loop 2 3) (re.range "0" "9")) (str.to_re ".") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re ".") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "/") ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 2 2) (re.range "0" "9"))))))
; User-Agent\u{3A}\s+source\=IncrediFind
(assert (str.in_re X (re.++ (str.to_re "User-Agent:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "source=IncrediFind\u{a}"))))
(check-sat)
