(declare-const X String)
; ^100$|^\d{0,2}(\.\d{1,2})? *%?$
(assert (not (str.in_re X (re.union (str.to_re "100") (re.++ ((_ re.loop 0 2) (re.range "0" "9")) (re.opt (re.++ (str.to_re ".") ((_ re.loop 1 2) (re.range "0" "9")))) (re.* (str.to_re " ")) (re.opt (str.to_re "%")) (str.to_re "\u{a}"))))))
(check-sat)
