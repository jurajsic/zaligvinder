(set-logic QF_SLIA)
(declare-const X String)
; HWAE\s+\u{2F}ta\u{2F}NEWS\u{2F}Guptacharloomcompany\u{2E}com
(assert (not (str.in_re X (re.++ (str.to_re "HWAE") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "/ta/NEWS/Guptacharloomcompany.com\u{a}")))))
(check-sat)
