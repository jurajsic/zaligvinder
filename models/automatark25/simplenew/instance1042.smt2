(declare-const X String)
; /bincode=Wz[0-9A-Za-z\u{2b}\u{2f}]{32}\u{3d}{0,2}$/Um
(assert (not (str.in_re X (re.++ (str.to_re "/bincode=Wz") ((_ re.loop 32 32) (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "+") (str.to_re "/"))) ((_ re.loop 0 2) (str.to_re "=")) (str.to_re "/Um\u{a}")))))
(check-sat)
