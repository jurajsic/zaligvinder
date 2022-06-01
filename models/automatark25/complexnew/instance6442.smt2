(declare-const X String)
; Server\u{3A}WordTheHost\u{3a}from
(assert (not (str.in_re X (str.to_re "Server:WordTheHost:from\u{a}"))))
; /\u{2e}mkv([\?\u{5c}\u{2f}]|$)/smiU
(assert (str.in_re X (re.++ (str.to_re "/.mkv") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}"))))
; \b[1-9]{1}[0-9]{1,5}-\d{2}-\d\b
(assert (str.in_re X (re.++ ((_ re.loop 1 1) (re.range "1" "9")) ((_ re.loop 1 5) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "-") (re.range "0" "9") (str.to_re "\u{a}"))))
(check-sat)
