(declare-const X String)
; /^\/amor\d{0,2}\.jar/U
(assert (not (str.in_re X (re.++ (str.to_re "//amor") ((_ re.loop 0 2) (re.range "0" "9")) (str.to_re ".jar/U\u{a}")))))
; ^([0-9]*)+(,[0-9]+)+$
(assert (not (str.in_re X (re.++ (re.+ (re.* (re.range "0" "9"))) (re.+ (re.++ (str.to_re ",") (re.+ (re.range "0" "9")))) (str.to_re "\u{a}")))))
(check-sat)
