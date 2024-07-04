(set-logic QF_SLIA)
(declare-const X String)
; ((^\d{5}$)|(^\d{8}$))|(^\d{5}-\d{3}$)
(assert (str.in_re X (re.union (re.++ (str.to_re "\u{a}") ((_ re.loop 5 5) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 3 3) (re.range "0" "9"))) ((_ re.loop 5 5) (re.range "0" "9")) ((_ re.loop 8 8) (re.range "0" "9")))))
; ^(0?[1-9]|[12][0-9]|3[01])[- /.](0?[1-9]|1[012])[- /.](19|20)?[0-9]{2}? ?((([0-1]?\d)|(2[0-3])):[0-5]\d)?(:[0-5]\d)? ?([a,p,A,P][m,M])?$
(assert (str.in_re X (re.++ (re.union (re.++ (re.opt (str.to_re "0")) (re.range "1" "9")) (re.++ (re.union (str.to_re "1") (str.to_re "2")) (re.range "0" "9")) (re.++ (str.to_re "3") (re.union (str.to_re "0") (str.to_re "1")))) (re.union (str.to_re "-") (str.to_re " ") (str.to_re "/") (str.to_re ".")) (re.union (re.++ (re.opt (str.to_re "0")) (re.range "1" "9")) (re.++ (str.to_re "1") (re.union (str.to_re "0") (str.to_re "1") (str.to_re "2")))) (re.union (str.to_re "-") (str.to_re " ") (str.to_re "/") (str.to_re ".")) (re.opt (re.union (str.to_re "19") (str.to_re "20"))) ((_ re.loop 2 2) (re.range "0" "9")) (re.opt (str.to_re " ")) (re.opt (re.++ (re.union (re.++ (re.opt (re.range "0" "1")) (re.range "0" "9")) (re.++ (str.to_re "2") (re.range "0" "3"))) (str.to_re ":") (re.range "0" "5") (re.range "0" "9"))) (re.opt (re.++ (str.to_re ":") (re.range "0" "5") (re.range "0" "9"))) (re.opt (str.to_re " ")) (re.opt (re.++ (re.union (str.to_re "a") (str.to_re ",") (str.to_re "p") (str.to_re "A") (str.to_re "P")) (re.union (str.to_re "m") (str.to_re ",") (str.to_re "M")))) (str.to_re "\u{a}"))))
; /^Subject\u{3A}[^\r\n]*Trojaner-Info\sNewsletter/smi
(assert (not (str.in_re X (re.++ (str.to_re "/Subject:") (re.* (re.union (str.to_re "\u{d}") (str.to_re "\u{a}"))) (str.to_re "Trojaner-Info") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "Newsletter/smi\u{a}")))))
; log\=\u{7B}IP\u{3A}Referer\u{3A}www\u{2E}mirarsearch\u{2E}com\u{2E}txte2give\.comSpywareStrikeConnectedIPSubject\u{3A}
(assert (str.in_re X (str.to_re "log={IP:Referer:www.mirarsearch.com.txte2give.comSpywareStrikeConnectedIPSubject:\u{a}")))
(check-sat)
