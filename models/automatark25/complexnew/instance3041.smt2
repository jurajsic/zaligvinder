(declare-const X String)
; ^[-+]?\d+(\.\d{2})?$
(assert (not (str.in_re X (re.++ (re.opt (re.union (str.to_re "-") (str.to_re "+"))) (re.+ (re.range "0" "9")) (re.opt (re.++ (str.to_re ".") ((_ re.loop 2 2) (re.range "0" "9")))) (str.to_re "\u{a}")))))
; S\u{3a}Users\u{5c}IterenetSend=User-Agent\u{3A}
(assert (not (str.in_re X (str.to_re "S:Users\u{5c}IterenetSend=User-Agent:\u{a}"))))
(check-sat)
