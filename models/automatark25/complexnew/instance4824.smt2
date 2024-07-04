(set-logic QF_SLIA)
(declare-const X String)
; /filename=[^\n]*\u{2e}docm/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".docm/i\u{a}")))))
; (([\w-]+://?|www[.])[^\s()<>]+)
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") (re.union (re.++ (re.+ (re.union (str.to_re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re ":/") (re.opt (str.to_re "/"))) (str.to_re "www.")) (re.+ (re.union (str.to_re "(") (str.to_re ")") (str.to_re "<") (str.to_re ">") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")))))))
; ((\(?\d{2,5}\)?)?(\d|-| )?(15((\d|-| ){6,13})))
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") (re.opt (re.++ (re.opt (str.to_re "(")) ((_ re.loop 2 5) (re.range "0" "9")) (re.opt (str.to_re ")")))) (re.opt (re.union (re.range "0" "9") (str.to_re "-") (str.to_re " "))) (str.to_re "15") ((_ re.loop 6 13) (re.union (re.range "0" "9") (str.to_re "-") (str.to_re " ")))))))
(check-sat)
