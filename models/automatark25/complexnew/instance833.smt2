(set-logic QF_SLIA)
(declare-const X String)
; ((\(\d{2}\) ?)|(\d{2}/))?\d{2}/\d{4} ([0-2][0-9]\:[0-6][0-9])
(assert (str.in_re X (re.++ (re.opt (re.union (re.++ (str.to_re "(") ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re ")") (re.opt (str.to_re " "))) (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "/")))) ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "/") ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re " \u{a}") (re.range "0" "2") (re.range "0" "9") (str.to_re ":") (re.range "0" "6") (re.range "0" "9"))))
; ProjectMyWebSearchSearchAssistantfast-look\u{2E}comOneReporter
(assert (str.in_re X (str.to_re "ProjectMyWebSearchSearchAssistantfast-look.comOneReporter\u{a}")))
; (^\d{5}$)|(^\d{5}-\d{4}$)
(assert (not (str.in_re X (re.union ((_ re.loop 5 5) (re.range "0" "9")) (re.++ (str.to_re "\u{a}") ((_ re.loop 5 5) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 4 4) (re.range "0" "9")))))))
(check-sat)
