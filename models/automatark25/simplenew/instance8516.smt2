(declare-const X String)
; /\?java\=[0-9]{2,6}$/U
(assert (str.in_re X (re.++ (str.to_re "/?java=") ((_ re.loop 2 6) (re.range "0" "9")) (str.to_re "/U\u{a}"))))
(check-sat)
