(set-logic QF_SLIA)
(declare-const X String)
; ^([\w]+@([\w]+\.)+[a-zA-Z]{2,9}(\s*;\s*[\w]+@([\w]+\.)+[a-zA-Z]{2,9})*)$
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "@") (re.+ (re.++ (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "."))) ((_ re.loop 2 9) (re.union (re.range "a" "z") (re.range "A" "Z"))) (re.* (re.++ (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re ";") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "@") (re.+ (re.++ (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "."))) ((_ re.loop 2 9) (re.union (re.range "a" "z") (re.range "A" "Z")))))))))
; DA\dwww\u{2E}e-finder\u{2E}cc.*User-Agent\u{3A}
(assert (not (str.in_re X (re.++ (str.to_re "DA") (re.range "0" "9") (str.to_re "www.e-finder.cc") (re.* re.allchar) (str.to_re "User-Agent:\u{a}")))))
(check-sat)
