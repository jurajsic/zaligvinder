(set-logic QF_SLIA)
(declare-const X String)
; ^(958([0-9])+([0-9])+([0-9])+([0-9])+([0-9])+([0-9])+)|(958-([0-9])+([0-9])+([0-9])+([0-9])+([0-9])+([0-9])+)$
(assert (str.in_re X (re.union (re.++ (str.to_re "958") (re.+ (re.range "0" "9")) (re.+ (re.range "0" "9")) (re.+ (re.range "0" "9")) (re.+ (re.range "0" "9")) (re.+ (re.range "0" "9")) (re.+ (re.range "0" "9"))) (re.++ (str.to_re "\u{a}958-") (re.+ (re.range "0" "9")) (re.+ (re.range "0" "9")) (re.+ (re.range "0" "9")) (re.+ (re.range "0" "9")) (re.+ (re.range "0" "9")) (re.+ (re.range "0" "9"))))))
; /^sleep\u{7c}\d+\u{7c}\d+\u{7C}[a-z0-9]+\u{2E}[a-z]{2,3}\u{7C}[a-z0-9]+\u{7C}/
(assert (not (str.in_re X (re.++ (str.to_re "/sleep|") (re.+ (re.range "0" "9")) (str.to_re "|") (re.+ (re.range "0" "9")) (str.to_re "|") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re ".") ((_ re.loop 2 3) (re.range "a" "z")) (str.to_re "|") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re "|/\u{a}")))))
; ^[0-9]{2}
(assert (str.in_re X (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "\u{a}"))))
(check-sat)
