(declare-const X String)
; <link href="../Common/Styles/iLienStyle.css" type="text/css" rel="stylesheet" />
(assert (str.in_re X (re.++ (str.to_re "<link href=\u{22}") re.allchar re.allchar (str.to_re "/Common/Styles/iLienStyle") re.allchar (str.to_re "css\u{22} type=\u{22}text/css\u{22} rel=\u{22}stylesheet\u{22} />\u{a}"))))
; /^.{27}/sR
(assert (str.in_re X (re.++ (str.to_re "/") ((_ re.loop 27 27) re.allchar) (str.to_re "/sR\u{a}"))))
(check-sat)
