(set-logic QF_SLIA)
(declare-const X String)
; ^([0-9]{6}[\s\-]{1}[0-9]{12}|[0-9]{18})$
(assert (not (str.in_re X (re.++ (re.union (re.++ ((_ re.loop 6 6) (re.range "0" "9")) ((_ re.loop 1 1) (re.union (str.to_re "-") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 12 12) (re.range "0" "9"))) ((_ re.loop 18 18) (re.range "0" "9"))) (str.to_re "\u{a}")))))
; /SOAPAction\u{3a}[^\r\n]*Get(ServerTime|FileList|File)\u{22}/i
(assert (str.in_re X (re.++ (str.to_re "/SOAPAction:") (re.* (re.union (str.to_re "\u{d}") (str.to_re "\u{a}"))) (str.to_re "Get") (re.union (str.to_re "ServerTime") (str.to_re "FileList") (str.to_re "File")) (str.to_re "\u{22}/i\u{a}"))))
(check-sat)
