(set-logic QF_SLIA)
(declare-const X String)
; /\.php\u{3f}w\u{3d}\d+\u{26}n\u{3d}\d+/U
(assert (not (str.in_re X (re.++ (str.to_re "/.php?w=") (re.+ (re.range "0" "9")) (str.to_re "&n=") (re.+ (re.range "0" "9")) (str.to_re "/U\u{a}")))))
; \u{2F}searchfast\u{2F}\s+Host\u{3A}\s+
(assert (str.in_re X (re.++ (str.to_re "/searchfast/") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Host:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "\u{a}"))))
; User-Agent\u{3A}BetaWordixqshv\u{2f}qzccsServer\u{0}
(assert (str.in_re X (str.to_re "User-Agent:BetaWordixqshv/qzccsServer\u{0}\u{a}")))
; ^((0?[1-9]|1[012])(:[0-5]\d){1,2}(\ [AaPp][Mm]))$
(assert (str.in_re X (re.++ (str.to_re "\u{a}") (re.union (re.++ (re.opt (str.to_re "0")) (re.range "1" "9")) (re.++ (str.to_re "1") (re.union (str.to_re "0") (str.to_re "1") (str.to_re "2")))) ((_ re.loop 1 2) (re.++ (str.to_re ":") (re.range "0" "5") (re.range "0" "9"))) (str.to_re " ") (re.union (str.to_re "A") (str.to_re "a") (str.to_re "P") (str.to_re "p")) (re.union (str.to_re "M") (str.to_re "m")))))
(check-sat)
