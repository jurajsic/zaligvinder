(set-logic QF_SLIA)
(declare-const X String)
; /filename=[^\n]*\u{2e}dbp/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".dbp/i\u{a}"))))
; ^(([1-9][0-9]*)|((([0])|([1-9][0-9]*))\.[0-9]+)|((([1-9][0-9]*)|((([0])|([1-9][0-9]*))\.[0-9]+))\:)*(([1-9][0-9]*)|((([0])|([1-9][0-9]*))\.[0-9]+)))$
(assert (not (str.in_re X (re.++ (re.union (re.++ (re.range "1" "9") (re.* (re.range "0" "9"))) (re.++ (re.union (str.to_re "0") (re.++ (re.range "1" "9") (re.* (re.range "0" "9")))) (str.to_re ".") (re.+ (re.range "0" "9"))) (re.++ (re.* (re.++ (re.union (re.++ (re.range "1" "9") (re.* (re.range "0" "9"))) (re.++ (re.union (str.to_re "0") (re.++ (re.range "1" "9") (re.* (re.range "0" "9")))) (str.to_re ".") (re.+ (re.range "0" "9")))) (str.to_re ":"))) (re.union (re.++ (re.range "1" "9") (re.* (re.range "0" "9"))) (re.++ (re.union (str.to_re "0") (re.++ (re.range "1" "9") (re.* (re.range "0" "9")))) (str.to_re ".") (re.+ (re.range "0" "9")))))) (str.to_re "\u{a}")))))
; Subject\u{3a}\s+Yeah\!Online\u{25}21\u{25}21\u{25}21
(assert (str.in_re X (re.++ (str.to_re "Subject:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Yeah!Online%21%21%21\u{a}"))))
; Host\u{3A}as\u{2E}starware\u{2E}com\u{2F}dp\u{2F}search\?x=
(assert (not (str.in_re X (str.to_re "Host:as.starware.com/dp/search?x=\u{a}"))))
; ^0$|^[1-9][0-9]*$|^[1-9][0-9]{0,2}(,[0-9]{3})$
(assert (str.in_re X (re.union (str.to_re "0") (re.++ (re.range "1" "9") (re.* (re.range "0" "9"))) (re.++ (re.range "1" "9") ((_ re.loop 0 2) (re.range "0" "9")) (str.to_re "\u{a},") ((_ re.loop 3 3) (re.range "0" "9"))))))
(check-sat)
