(set-logic QF_SLIA)
(declare-const X String)
; <!--[\d\D]*?-->
(assert (str.in_re X (re.++ (str.to_re "<!--") (re.* (re.union (re.range "0" "9") (re.comp (re.range "0" "9")))) (str.to_re "-->\u{a}"))))
; \u{7D}\u{7B}Trojan\u{3A}\w+by\w+dddlogin\u{2E}dudu\u{2E}comSurveillanceIPOblivionhoroscope
(assert (not (str.in_re X (re.++ (str.to_re "}{Trojan:") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "by") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "dddlogin.dudu.comSurveillance\u{13}IPOblivionhoroscope\u{a}")))))
; \-?(90|[0-8]?[0-9]\.[0-9]{0,6})\,\-?(180|(1[0-7][0-9]|[0-9]{0,2})\.[0-9]{0,6})
(assert (not (str.in_re X (re.++ (re.opt (str.to_re "-")) (re.union (str.to_re "90") (re.++ (re.opt (re.range "0" "8")) (re.range "0" "9") (str.to_re ".") ((_ re.loop 0 6) (re.range "0" "9")))) (str.to_re ",") (re.opt (str.to_re "-")) (re.union (str.to_re "180") (re.++ (re.union (re.++ (str.to_re "1") (re.range "0" "7") (re.range "0" "9")) ((_ re.loop 0 2) (re.range "0" "9"))) (str.to_re ".") ((_ re.loop 0 6) (re.range "0" "9")))) (str.to_re "\u{a}")))))
(check-sat)
