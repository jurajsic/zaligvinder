(set-logic QF_SLIA)
(declare-const X String)
; ^(.|\r|\n){1,10}$
(assert (not (str.in_re X (re.++ ((_ re.loop 1 10) (re.union re.allchar (str.to_re "\u{d}") (str.to_re "\u{a}"))) (str.to_re "\u{a}")))))
; /\u{28}compatible\u{3b}[A-Z]*\u{3b}\u{29}\u{d}\u{a}/H
(assert (str.in_re X (re.++ (str.to_re "/(compatible;") (re.* (re.range "A" "Z")) (str.to_re ";)\u{d}\u{a}/H\u{a}"))))
; ^([01]\d|2[0123])([0-5]\d){2}([0-99]\d)$
(assert (not (str.in_re X (re.++ (re.union (re.++ (re.union (str.to_re "0") (str.to_re "1")) (re.range "0" "9")) (re.++ (str.to_re "2") (re.union (str.to_re "0") (str.to_re "1") (str.to_re "2") (str.to_re "3")))) ((_ re.loop 2 2) (re.++ (re.range "0" "5") (re.range "0" "9"))) (str.to_re "\u{a}") (re.union (re.range "0" "9") (str.to_re "9")) (re.range "0" "9")))))
; User-Agent\u{3A}User-Agent\u{3a}URLencoderthis\u{7C}Connected
(assert (not (str.in_re X (str.to_re "User-Agent:User-Agent:URLencoderthis|Connected\u{a}"))))
(check-sat)
