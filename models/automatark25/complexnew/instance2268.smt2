(set-logic QF_SLIA)
(declare-const X String)
; s_sq=aolsnssigninUser-Agent\u{3A}
(assert (not (str.in_re X (str.to_re "s_sq=aolsnssigninUser-Agent:\u{a}"))))
; (^[1-9]{1,3}(,\d{3})*$)|(^0$)
(assert (not (str.in_re X (re.union (re.++ ((_ re.loop 1 3) (re.range "1" "9")) (re.* (re.++ (str.to_re ",") ((_ re.loop 3 3) (re.range "0" "9"))))) (str.to_re "0\u{a}")))))
(check-sat)
