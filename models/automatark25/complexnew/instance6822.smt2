(set-logic QF_SLIA)
(declare-const X String)
; ^(\(\d{3}\)|\d{3})[\s.-]?\d{3}[\s.-]?\d{4}$
(assert (str.in_re X (re.++ (re.union (re.++ (str.to_re "(") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re ")")) ((_ re.loop 3 3) (re.range "0" "9"))) (re.opt (re.union (str.to_re ".") (str.to_re "-") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to_re ".") (str.to_re "-") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}"))))
; /filename=[^\n]*\u{2e}swf/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".swf/i\u{a}"))))
; /^SpyBuddy\s+Activity\s+Logs/smi
(assert (not (str.in_re X (re.++ (str.to_re "/SpyBuddy") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Activity") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Logs/smi\u{a}")))))
; /[^imsxeADSUXu]([imsxeADSUXu]*)$/
(assert (str.in_re X (re.++ (str.to_re "/") (re.union (str.to_re "i") (str.to_re "m") (str.to_re "s") (str.to_re "x") (str.to_re "e") (str.to_re "A") (str.to_re "D") (str.to_re "S") (str.to_re "U") (str.to_re "X") (str.to_re "u")) (re.* (re.union (str.to_re "i") (str.to_re "m") (str.to_re "s") (str.to_re "x") (str.to_re "e") (str.to_re "A") (str.to_re "D") (str.to_re "S") (str.to_re "U") (str.to_re "X") (str.to_re "u"))) (str.to_re "/\u{a}"))))
(check-sat)
