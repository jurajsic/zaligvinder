(declare-const X String)
; ^[-+]?(\d?\d?\d?,?)?(\d{3}\,?)*$
(assert (not (str.in_re X (re.++ (re.opt (re.union (str.to_re "-") (str.to_re "+"))) (re.opt (re.++ (re.opt (re.range "0" "9")) (re.opt (re.range "0" "9")) (re.opt (re.range "0" "9")) (re.opt (str.to_re ",")))) (re.* (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (str.to_re ",")))) (str.to_re "\u{a}")))))
; /\/\d+\.mp3$/U
(assert (str.in_re X (re.++ (str.to_re "//") (re.+ (re.range "0" "9")) (str.to_re ".mp3/U\u{a}"))))
(check-sat)
