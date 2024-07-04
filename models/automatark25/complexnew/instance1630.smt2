(set-logic QF_SLIA)
(declare-const X String)
; started\u{2E}.*\/cgi-bin\/PopupV
(assert (not (str.in_re X (re.++ (str.to_re "started.") (re.* re.allchar) (str.to_re "/cgi-bin/PopupV\u{a}")))))
; \b[A-z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b
(assert (str.in_re X (re.++ (re.+ (re.union (re.range "A" "z") (re.range "0" "9") (str.to_re ".") (str.to_re "_") (str.to_re "%") (str.to_re "-"))) (str.to_re "@") (re.+ (re.union (re.range "A" "Z") (re.range "0" "9") (str.to_re ".") (str.to_re "-"))) (str.to_re ".") ((_ re.loop 2 4) (re.range "A" "Z")) (str.to_re "\u{a}"))))
(check-sat)
