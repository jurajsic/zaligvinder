(set-logic QF_SLIA)
(declare-const X String)
; InformationSubject\u{3A}SpynovabyBlacksnprtz\u{7C}dialnoSearch
(assert (str.in_re X (str.to_re "InformationSubject:SpynovabyBlacksnprtz|dialnoSearch\u{a}")))
; \u{22}The\s+e2give\.com\s+NETObserve
(assert (not (str.in_re X (re.++ (str.to_re "\u{22}The") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "e2give.com") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "NETObserve\u{a}")))))
; /filename=[^\n]*\u{2e}wps/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".wps/i\u{a}"))))
; ^[-+]?[0-9]\d{0,2}(\.\d{1,2})?%?$
(assert (not (str.in_re X (re.++ (re.opt (re.union (str.to_re "-") (str.to_re "+"))) (re.range "0" "9") ((_ re.loop 0 2) (re.range "0" "9")) (re.opt (re.++ (str.to_re ".") ((_ re.loop 1 2) (re.range "0" "9")))) (re.opt (str.to_re "%")) (str.to_re "\u{a}")))))
; (([01][\.\- +]\(\d{3}\)[\.\- +]?)|([01][\.\- +]\d{3}[\.\- +])|(\(\d{3}\) ?)|(\d{3}[- \.]))?\d{3}[- \.]\d{4}
(assert (not (str.in_re X (re.++ (re.opt (re.union (re.++ (re.union (str.to_re "0") (str.to_re "1")) (re.union (str.to_re ".") (str.to_re "-") (str.to_re " ") (str.to_re "+")) (str.to_re "(") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re ")") (re.opt (re.union (str.to_re ".") (str.to_re "-") (str.to_re " ") (str.to_re "+")))) (re.++ (re.union (str.to_re "0") (str.to_re "1")) (re.union (str.to_re ".") (str.to_re "-") (str.to_re " ") (str.to_re "+")) ((_ re.loop 3 3) (re.range "0" "9")) (re.union (str.to_re ".") (str.to_re "-") (str.to_re " ") (str.to_re "+"))) (re.++ (str.to_re "(") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re ")") (re.opt (str.to_re " "))) (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (re.union (str.to_re "-") (str.to_re " ") (str.to_re "."))))) ((_ re.loop 3 3) (re.range "0" "9")) (re.union (str.to_re "-") (str.to_re " ") (str.to_re ".")) ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}")))))
(check-sat)
