(declare-const X String)
; User-Agent\u{3A}register\.aspUser-Agent\u{3A}Host\u{3A}cdpView
(assert (not (str.in_re X (str.to_re "User-Agent:register.aspUser-Agent:Host:cdpView\u{a}"))))
; ^(([0-9]{3})[ \-\/]?([0-9]{3})[ \-\/]?([0-9]{3}))|([0-9]{9})|([\+]?([0-9]{3})[ \-\/]?([0-9]{2})[ \-\/]?([0-9]{3})[ \-\/]?([0-9]{3}))$
(assert (not (str.in_re X (re.union (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "-") (str.to_re "/"))) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "-") (str.to_re "/"))) ((_ re.loop 3 3) (re.range "0" "9"))) ((_ re.loop 9 9) (re.range "0" "9")) (re.++ (str.to_re "\u{a}") (re.opt (str.to_re "+")) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "-") (str.to_re "/"))) ((_ re.loop 2 2) (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "-") (str.to_re "/"))) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "-") (str.to_re "/"))) ((_ re.loop 3 3) (re.range "0" "9")))))))
; seqepagqfphv\u{2f}sfdX-Mailer\u{3A}
(assert (str.in_re X (str.to_re "seqepagqfphv/sfdX-Mailer:\u{13}\u{a}")))
(check-sat)
