(declare-const X String)
; (^[0]{1}$|^[-]?[1-9]{1}\d*$)
(assert (str.in_re X (re.++ (re.union ((_ re.loop 1 1) (str.to_re "0")) (re.++ (re.opt (str.to_re "-")) ((_ re.loop 1 1) (re.range "1" "9")) (re.* (re.range "0" "9")))) (str.to_re "\u{a}"))))
; /\/stat_n\/$/U
(assert (str.in_re X (str.to_re "//stat_n//U\u{a}")))
(check-sat)
