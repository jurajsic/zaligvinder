(set-logic QF_SLIA)
(declare-const X String)
; password\u{3B}1\u{3B}OptixOwner\u{3A}Barwww\u{2E}accoona\u{2E}com
(assert (str.in_re X (str.to_re "password;1;OptixOwner:Barwww.accoona.com\u{a}")))
; Subject\u{3A}LOGX-Mailer\u{3a}
(assert (str.in_re X (str.to_re "Subject:LOGX-Mailer:\u{13}\u{a}")))
; [1-2][0|9][0-9]{2}[0-1][0-9][0-3][0-9][-][0-9]{4}
(assert (not (str.in_re X (re.++ (re.range "1" "2") (re.union (str.to_re "0") (str.to_re "|") (str.to_re "9")) ((_ re.loop 2 2) (re.range "0" "9")) (re.range "0" "1") (re.range "0" "9") (re.range "0" "3") (re.range "0" "9") (str.to_re "-") ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}")))))
; (^(49030)[2-9](\d{10}$|\d{12,13}$))
(assert (str.in_re X (re.++ (str.to_re "\u{a}49030") (re.range "2" "9") (re.union ((_ re.loop 10 10) (re.range "0" "9")) ((_ re.loop 12 13) (re.range "0" "9"))))))
; /filename=[^\n]*\u{2e}xspf/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".xspf/i\u{a}"))))
(check-sat)
