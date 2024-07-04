(set-logic QF_SLIA)
(declare-const X String)
; ^([0-9]{1})([0-9]{2})([0-9]{2})([0-9]{7})([0-9]{1})$
(assert (not (str.in_re X (re.++ ((_ re.loop 1 1) (re.range "0" "9")) ((_ re.loop 2 2) (re.range "0" "9")) ((_ re.loop 2 2) (re.range "0" "9")) ((_ re.loop 7 7) (re.range "0" "9")) ((_ re.loop 1 1) (re.range "0" "9")) (str.to_re "\u{a}")))))
; ookflolfctm\u{2f}nmot\.fmu
(assert (not (str.in_re X (str.to_re "ookflolfctm/nmot.fmu\u{a}"))))
(check-sat)
