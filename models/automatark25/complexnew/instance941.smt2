(set-logic QF_SLIA)
(declare-const X String)
; /^"|'+(.*)+"$|'$/
(assert (str.in_re X (re.union (str.to_re "/\u{22}") (re.++ (re.+ (str.to_re "'")) (re.+ (re.* re.allchar)) (str.to_re "\u{22}")) (str.to_re "'/\u{a}"))))
; /filename=[^\n]*\u{2e}hpj/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".hpj/i\u{a}"))))
; (^0?[1-9]|^1[0-2])\/(0?[1-9]|[1-2][0-9]|3[0-1])\/(19|20)?[0-9][0-9](\s(((0?[0-9]|1[0-9]|2[0-3]):[0-5][0-9](:[0-5][0-9])?)|((0?[0-9]|1[0-2]):[0-5][0-9](:[0-5][0-9])?\s(AM|PM))))?$
(assert (str.in_re X (re.++ (re.union (re.++ (re.opt (str.to_re "0")) (re.range "1" "9")) (re.++ (str.to_re "1") (re.range "0" "2"))) (str.to_re "/") (re.union (re.++ (re.opt (str.to_re "0")) (re.range "1" "9")) (re.++ (re.range "1" "2") (re.range "0" "9")) (re.++ (str.to_re "3") (re.range "0" "1"))) (str.to_re "/") (re.opt (re.union (str.to_re "19") (str.to_re "20"))) (re.range "0" "9") (re.range "0" "9") (re.opt (re.++ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (re.union (re.++ (re.union (re.++ (re.opt (str.to_re "0")) (re.range "0" "9")) (re.++ (str.to_re "1") (re.range "0" "9")) (re.++ (str.to_re "2") (re.range "0" "3"))) (str.to_re ":") (re.range "0" "5") (re.range "0" "9") (re.opt (re.++ (str.to_re ":") (re.range "0" "5") (re.range "0" "9")))) (re.++ (re.union (re.++ (re.opt (str.to_re "0")) (re.range "0" "9")) (re.++ (str.to_re "1") (re.range "0" "2"))) (str.to_re ":") (re.range "0" "5") (re.range "0" "9") (re.opt (re.++ (str.to_re ":") (re.range "0" "5") (re.range "0" "9"))) (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (re.union (str.to_re "AM") (str.to_re "PM")))))) (str.to_re "\u{a}"))))
; ^([0-9]{2})?(\([0-9]{2})\)([0-9]{3}|[0-9]{4})-[0-9]{4}$
(assert (str.in_re X (re.++ (re.opt ((_ re.loop 2 2) (re.range "0" "9"))) (str.to_re ")") (re.union ((_ re.loop 3 3) (re.range "0" "9")) ((_ re.loop 4 4) (re.range "0" "9"))) (str.to_re "-") ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}(") ((_ re.loop 2 2) (re.range "0" "9")))))
(check-sat)
