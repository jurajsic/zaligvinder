(declare-const X String)
; /\(\?[gimxs]{1,5}\)/
(assert (not (str.in_re X (re.++ (str.to_re "/(?") ((_ re.loop 1 5) (re.union (str.to_re "g") (str.to_re "i") (str.to_re "m") (str.to_re "x") (str.to_re "s"))) (str.to_re ")/\u{a}")))))
(check-sat)
