(declare-const X String)
; ^([0-9]{1,2},([0-9]{2},)*[0-9]{3}|[0-9]+)$
(assert (not (str.in_re X (re.++ (re.union (re.++ ((_ re.loop 1 2) (re.range "0" "9")) (str.to_re ",") (re.* (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re ","))) ((_ re.loop 3 3) (re.range "0" "9"))) (re.+ (re.range "0" "9"))) (str.to_re "\u{a}")))))
; /php\?jnlp\=[a-f0-9]{10}($|\u{2c})/U
(assert (not (str.in_re X (re.++ (str.to_re "/php?jnlp=") ((_ re.loop 10 10) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re ",/U\u{a}")))))
; /\u{2e}smi([\?\u{5c}\u{2f}]|$)/smiU
(assert (str.in_re X (re.++ (str.to_re "/.smi") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}"))))
(check-sat)
