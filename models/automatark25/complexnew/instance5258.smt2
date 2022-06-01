(declare-const X String)
; ^100(\.0{0,2})? *%?$|^\d{1,2}(\.\d{1,2})? *%?$
(assert (not (str.in_re X (re.union (re.++ (str.to_re "100") (re.opt (re.++ (str.to_re ".") ((_ re.loop 0 2) (str.to_re "0")))) (re.* (str.to_re " ")) (re.opt (str.to_re "%"))) (re.++ ((_ re.loop 1 2) (re.range "0" "9")) (re.opt (re.++ (str.to_re ".") ((_ re.loop 1 2) (re.range "0" "9")))) (re.* (str.to_re " ")) (re.opt (str.to_re "%")) (str.to_re "\u{a}"))))))
; User-Agent\u{3A}.*Host\u{3A}\dName=Your\+Host\+is\u{3A}
(assert (not (str.in_re X (re.++ (str.to_re "User-Agent:") (re.* re.allchar) (str.to_re "Host:") (re.range "0" "9") (str.to_re "Name=Your+Host+is:\u{a}")))))
; ^(\d{3}|\d{4})[-](\d{5})$
(assert (not (str.in_re X (re.++ (re.union ((_ re.loop 3 3) (re.range "0" "9")) ((_ re.loop 4 4) (re.range "0" "9"))) (str.to_re "-") ((_ re.loop 5 5) (re.range "0" "9")) (str.to_re "\u{a}")))))
; vbwwwc\.goclick\.compassword\u{3B}0\u{3B}Incorrect
(assert (not (str.in_re X (str.to_re "vbwwwc.goclick.compassword;0;Incorrect\u{a}"))))
(check-sat)
