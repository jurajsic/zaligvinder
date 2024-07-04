(set-logic QF_SLIA)
(declare-const X String)
; ^(\d?)*(\.\d{1}|\.\d{2})?$
(assert (str.in_re X (re.++ (re.* (re.opt (re.range "0" "9"))) (re.opt (re.++ (str.to_re ".") (re.union ((_ re.loop 1 1) (re.range "0" "9")) ((_ re.loop 2 2) (re.range "0" "9"))))) (str.to_re "\u{a}"))))
; [0-9][0-9][0-9][0-9]-(0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-9]|3[0-1])\s{1}(0[0-9]|1[0-9]|2[0-3]):([0-5][0-9])
(assert (not (str.in_re X (re.++ (re.range "0" "9") (re.range "0" "9") (re.range "0" "9") (re.range "0" "9") (str.to_re "-") (re.union (re.++ (str.to_re "0") (re.range "1" "9")) (re.++ (str.to_re "1") (re.range "0" "2"))) (str.to_re "-") (re.union (re.++ (str.to_re "0") (re.range "1" "9")) (re.++ (str.to_re "1") (re.range "0" "9")) (re.++ (str.to_re "2") (re.range "0" "9")) (re.++ (str.to_re "3") (re.range "0" "1"))) ((_ re.loop 1 1) (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.union (re.++ (str.to_re "0") (re.range "0" "9")) (re.++ (str.to_re "1") (re.range "0" "9")) (re.++ (str.to_re "2") (re.range "0" "3"))) (str.to_re ":\u{a}") (re.range "0" "5") (re.range "0" "9")))))
; (:[a-z]{1}[a-z1-9\$#_]*){1,31}
(assert (str.in_re X (re.++ ((_ re.loop 1 31) (re.++ (str.to_re ":") ((_ re.loop 1 1) (re.range "a" "z")) (re.* (re.union (re.range "a" "z") (re.range "1" "9") (str.to_re "$") (str.to_re "#") (str.to_re "_"))))) (str.to_re "\u{a}"))))
; User-Agent\u{3A}.*User-Agent\u{3A}.*spyblini\u{2E}inidata\.warezclient\.com
(assert (str.in_re X (re.++ (str.to_re "User-Agent:") (re.* re.allchar) (str.to_re "User-Agent:") (re.* re.allchar) (str.to_re "spyblini.inidata.warezclient.com\u{a}"))))
(check-sat)
