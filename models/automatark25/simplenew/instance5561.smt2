(declare-const X String)
; (^\([0]\d{2}\))(\d{6,7}$)
(assert (not (str.in_re X (re.++ ((_ re.loop 6 7) (re.range "0" "9")) (str.to_re "\u{a}(0") ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re ")")))))
(check-sat)
