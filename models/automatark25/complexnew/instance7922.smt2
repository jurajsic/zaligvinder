(set-logic QF_SLIA)
(declare-const X String)
; ^([A-Z\d]{3})[A-Z]{2}\d{2}([A-Z\d]{1})([X\d]{1})([A-Z\d]{3})\d{5}$
(assert (not (str.in_re X (re.++ ((_ re.loop 3 3) (re.union (re.range "A" "Z") (re.range "0" "9"))) ((_ re.loop 2 2) (re.range "A" "Z")) ((_ re.loop 2 2) (re.range "0" "9")) ((_ re.loop 1 1) (re.union (re.range "A" "Z") (re.range "0" "9"))) ((_ re.loop 1 1) (re.union (str.to_re "X") (re.range "0" "9"))) ((_ re.loop 3 3) (re.union (re.range "A" "Z") (re.range "0" "9"))) ((_ re.loop 5 5) (re.range "0" "9")) (str.to_re "\u{a}")))))
; pass=Referer\u{3A}Surveillance
(assert (str.in_re X (str.to_re "pass=Referer:Surveillance\u{13}\u{a}")))
; /filename=[^\n]*\u{2e}por/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".por/i\u{a}"))))
; /[a-f0-9]{32}=[a-f0-9]{32}/C
(assert (str.in_re X (re.++ (str.to_re "/") ((_ re.loop 32 32) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "=") ((_ re.loop 32 32) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "/C\u{a}"))))
; /^ftp\u{7c}\d+\u{7c}\d+\u{7C}[a-z0-9]+\u{2E}[a-z]{2,3}\u{7C}[a-z0-9]+\u{7C}/
(assert (not (str.in_re X (re.++ (str.to_re "/ftp|") (re.+ (re.range "0" "9")) (str.to_re "|") (re.+ (re.range "0" "9")) (str.to_re "|") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re ".") ((_ re.loop 2 3) (re.range "a" "z")) (str.to_re "|") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re "|/\u{a}")))))
(check-sat)
