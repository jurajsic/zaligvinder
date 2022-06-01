(declare-const X String)
; ^(\d{1,8}|(\d{0,8}\.{1}\d{1,2}){1})$
(assert (str.in_re X (re.++ (re.union ((_ re.loop 1 8) (re.range "0" "9")) ((_ re.loop 1 1) (re.++ ((_ re.loop 0 8) (re.range "0" "9")) ((_ re.loop 1 1) (str.to_re ".")) ((_ re.loop 1 2) (re.range "0" "9"))))) (str.to_re "\u{a}"))))
; ovplSubject\u{3A}TencentTravelerClient\u{7D}\u{7B}Sysuptime\u{3A}
(assert (str.in_re X (str.to_re "ovplSubject:TencentTravelerClient}{Sysuptime:\u{a}")))
; We\d+pjpoptwql\u{2f}rlnjX-Mailer\u{3a}
(assert (str.in_re X (re.++ (str.to_re "We") (re.+ (re.range "0" "9")) (str.to_re "pjpoptwql/rlnjX-Mailer:\u{13}\u{a}"))))
(check-sat)
