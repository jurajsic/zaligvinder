(declare-const X String)
; SpyBuddyZOMBIES\u{5f}HTTP\u{5f}GETearch\u{2E}earthlink
(assert (not (str.in_re X (str.to_re "SpyBuddyZOMBIES_HTTP_GETearch.earthlink\u{a}"))))
; /filename=[^\n]*\u{2e}m4b/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".m4b/i\u{a}")))))
; ^(([+]31|0031)\s\(0\)([0-9]{9})|([+]31|0031)\s0([0-9]{9})|0([0-9]{9}))$
(assert (str.in_re X (re.++ (re.union (re.++ (re.union (str.to_re "+31") (str.to_re "0031")) (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "(0)") ((_ re.loop 9 9) (re.range "0" "9"))) (re.++ (re.union (str.to_re "+31") (str.to_re "0031")) (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "0") ((_ re.loop 9 9) (re.range "0" "9"))) (re.++ (str.to_re "0") ((_ re.loop 9 9) (re.range "0" "9")))) (str.to_re "\u{a}"))))
(check-sat)
