(declare-const X String)
; /filename=[^\n]*\u{2e}xlsx/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".xlsx/i\u{a}")))))
; sql.*badurl\u{2E}grandstreetinteractive\u{2E}com
(assert (str.in_re X (re.++ (str.to_re "sql") (re.* re.allchar) (str.to_re "badurl.grandstreetinteractive.com\u{a}"))))
; /\/[a-z0-9]{12}\.txt$/U
(assert (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 12 12) (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re ".txt/U\u{a}"))))
; /^\u{2f}\u{3f}xclve\u{5f}[a-zA-Z0-9]{30}$/Ui
(assert (str.in_re X (re.++ (str.to_re "//?xclve_") ((_ re.loop 30 30) (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9"))) (str.to_re "/Ui\u{a}"))))
(check-sat)
