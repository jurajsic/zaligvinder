(set-logic QF_SLIA)
(declare-const X String)
; /\u{2e}ttf([\?\u{5c}\u{2f}]|$)/smiU
(assert (str.in_re X (re.++ (str.to_re "/.ttf") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}"))))
; ^[ 1(]{0,3}?([02-9][0-9]{2})\D{0,2}([0-9]{3})\D?([0-9]{4})($|\D+.+$)
(assert (str.in_re X (re.++ ((_ re.loop 0 3) (re.union (str.to_re " ") (str.to_re "1") (str.to_re "("))) ((_ re.loop 0 2) (re.comp (re.range "0" "9"))) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.comp (re.range "0" "9"))) ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}") (re.union (str.to_re "0") (re.range "2" "9")) ((_ re.loop 2 2) (re.range "0" "9")) (re.+ (re.comp (re.range "0" "9"))) (re.+ re.allchar))))
; (^[A-Z]{1,2}[0-9]{1,}:{1}[A-Z]{1,2}[0-9]{1,}$)|(^\$(([A-Z])|([a-z])){1,2}([0-9]){1,}:{1}\$(([A-Z])|([a-z])){1,2}([0-9]){1,}$)|(^\$(([A-Z])|([a-z])){1,2}(\$){1}([0-9]){1,}:{1}\$(([A-Z])|([a-z])){1,2}(\$){1}([0-9]){1,}$)
(assert (not (str.in_re X (re.union (re.++ ((_ re.loop 1 2) (re.range "A" "Z")) (re.+ (re.range "0" "9")) ((_ re.loop 1 1) (str.to_re ":")) ((_ re.loop 1 2) (re.range "A" "Z")) (re.+ (re.range "0" "9"))) (re.++ (str.to_re "$") ((_ re.loop 1 2) (re.union (re.range "A" "Z") (re.range "a" "z"))) (re.+ (re.range "0" "9")) ((_ re.loop 1 1) (str.to_re ":")) (str.to_re "$") ((_ re.loop 1 2) (re.union (re.range "A" "Z") (re.range "a" "z"))) (re.+ (re.range "0" "9"))) (re.++ (str.to_re "\u{a}$") ((_ re.loop 1 2) (re.union (re.range "A" "Z") (re.range "a" "z"))) ((_ re.loop 1 1) (str.to_re "$")) (re.+ (re.range "0" "9")) ((_ re.loop 1 1) (str.to_re ":")) (str.to_re "$") ((_ re.loop 1 2) (re.union (re.range "A" "Z") (re.range "a" "z"))) ((_ re.loop 1 1) (str.to_re "$")) (re.+ (re.range "0" "9")))))))
(check-sat)
