(set-logic QF_SLIA)
(declare-const X String)
; [^"]+
(assert (not (str.in_re X (re.++ (re.+ (re.comp (str.to_re "\u{22}"))) (str.to_re "\u{a}")))))
; Ready\s+Client\dFrom\u{3A}Webtool\u{2E}world2\u{2E}cnUser-Agent\u{3A}User-Agent\u{3a}URLencoderthis\u{7C}Connected
(assert (not (str.in_re X (re.++ (str.to_re "Ready") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Client") (re.range "0" "9") (str.to_re "From:Webtool.world2.cn\u{13}User-Agent:User-Agent:URLencoderthis|Connected\u{a}")))))
; ^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&%\$#\=~_\-]+))*$
(assert (str.in_re X (re.++ (re.opt (re.++ (str.to_re "://") (re.union (re.++ (re.union (str.to_re "H") (str.to_re "h")) (re.union (str.to_re "T") (str.to_re "t"))) (str.to_re "F") (str.to_re "f")) (re.union (str.to_re "T") (str.to_re "t")) (re.union (str.to_re "P") (str.to_re "p")) (re.opt (re.union (str.to_re "S") (str.to_re "s"))))) (re.union (re.++ (str.to_re "www") re.allchar) (re.++ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9")) re.allchar)) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "-") (str.to_re "."))) (str.to_re ".") ((_ re.loop 2 6) (re.union (re.range "a" "z") (re.range "A" "Z"))) (re.* (re.++ (str.to_re ":") ((_ re.loop 1 5) (re.range "0" "9")))) (re.* (re.++ (str.to_re "/") (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re ".") (str.to_re ",") (str.to_re ";") (str.to_re "?") (str.to_re "'") (str.to_re "\u{5c}") (str.to_re "+") (str.to_re "&") (str.to_re "%") (str.to_re "$") (str.to_re "#") (str.to_re "=") (str.to_re "~") (str.to_re "_") (str.to_re "-"))))) (str.to_re "\u{a}"))))
; ((\d|([a-f]|[A-F])){2}:){5}(\d|([a-f]|[A-F])){2}
(assert (str.in_re X (re.++ ((_ re.loop 5 5) (re.++ ((_ re.loop 2 2) (re.union (re.range "0" "9") (re.range "a" "f") (re.range "A" "F"))) (str.to_re ":"))) ((_ re.loop 2 2) (re.union (re.range "0" "9") (re.range "a" "f") (re.range "A" "F"))) (str.to_re "\u{a}"))))
; \d[\d\,\.]+
(assert (not (str.in_re X (re.++ (re.range "0" "9") (re.+ (re.union (re.range "0" "9") (str.to_re ",") (str.to_re "."))) (str.to_re "\u{a}")))))
(check-sat)
