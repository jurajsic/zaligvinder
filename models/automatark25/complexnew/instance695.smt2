(set-logic QF_SLIA)
(declare-const X String)
; [-+]?((\.[0-9]+|[0-9]+\.[0-9]+)([eE][-+][0-9]+)?|[0-9]+)
(assert (str.in_re X (re.++ (re.opt (re.union (str.to_re "-") (str.to_re "+"))) (re.union (re.++ (re.union (re.++ (str.to_re ".") (re.+ (re.range "0" "9"))) (re.++ (re.+ (re.range "0" "9")) (str.to_re ".") (re.+ (re.range "0" "9")))) (re.opt (re.++ (re.union (str.to_re "e") (str.to_re "E")) (re.union (str.to_re "-") (str.to_re "+")) (re.+ (re.range "0" "9"))))) (re.+ (re.range "0" "9"))) (str.to_re "\u{a}"))))
; \u{2F}rss\d+answer\sHost\u{3A}
(assert (not (str.in_re X (re.++ (str.to_re "/rss") (re.+ (re.range "0" "9")) (str.to_re "answer") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "Host:\u{a}")))))
; ^(Op(.|us))(\s)[1-9](\d)*((,)?(\s)N(o.|um(.|ber))\s[1-9](\d)*)?$
(assert (not (str.in_re X (re.++ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (re.range "1" "9") (re.* (re.range "0" "9")) (re.opt (re.++ (re.opt (str.to_re ",")) (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "N") (re.union (re.++ (str.to_re "o") re.allchar) (re.++ (str.to_re "um") (re.union re.allchar (str.to_re "ber")))) (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (re.range "1" "9") (re.* (re.range "0" "9")))) (str.to_re "\u{a}Op") (re.union re.allchar (str.to_re "us"))))))
; /gate\u{2e}php\u{3f}id=[a-z]{15}/U
(assert (str.in_re X (re.++ (str.to_re "/gate.php?id=") ((_ re.loop 15 15) (re.range "a" "z")) (str.to_re "/U\u{a}"))))
(check-sat)
