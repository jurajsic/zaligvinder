(declare-const X String)
; PASSW=.*www\u{2E}makemesearch\u{2E}com.*HBand,X-Mailer\u{3A}
(assert (str.in_re X (re.++ (str.to_re "PASSW=") (re.* re.allchar) (str.to_re "www.makemesearch.com") (re.* re.allchar) (str.to_re "HBand,X-Mailer:\u{13}\u{a}"))))
; ^(0{1})([1-9]{2})(\s|-|.{0,1})(\d{3})(\s|-|.{0,1})(\d{2})(\s|-|.{0,1})(\d{2})$
(assert (not (str.in_re X (re.++ ((_ re.loop 1 1) (str.to_re "0")) ((_ re.loop 2 2) (re.range "1" "9")) (re.union (str.to_re "-") (re.opt re.allchar) (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) ((_ re.loop 3 3) (re.range "0" "9")) (re.union (str.to_re "-") (re.opt re.allchar) (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) ((_ re.loop 2 2) (re.range "0" "9")) (re.union (str.to_re "-") (re.opt re.allchar) (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "\u{a}")))))
; /filename=[^\n]*\u{2e}cgm/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".cgm/i\u{a}")))))
; ^[1-9]{1}$|^[1-9]{1}[0-9]{1}$|^[1-3]{1}[0-6]{1}[0-5]{1}$|^365$
(assert (not (str.in_re X (re.union ((_ re.loop 1 1) (re.range "1" "9")) (re.++ ((_ re.loop 1 1) (re.range "1" "9")) ((_ re.loop 1 1) (re.range "0" "9"))) (re.++ ((_ re.loop 1 1) (re.range "1" "3")) ((_ re.loop 1 1) (re.range "0" "6")) ((_ re.loop 1 1) (re.range "0" "5"))) (str.to_re "365\u{a}")))))
; /filename=[^\n]*\u{2e}pjpeg/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".pjpeg/i\u{a}"))))
(check-sat)
