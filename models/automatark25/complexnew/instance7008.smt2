(declare-const X String)
; ^[a-zA-Z0-9]{1,20}$
(assert (not (str.in_re X (re.++ ((_ re.loop 1 20) (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9"))) (str.to_re "\u{a}")))))
; [a-f0-9]{8}-[a-f0-9]{4}-3[a-f0-9]{3}-[89ab][a-f0-9]{3}-[a-f0-9]{12}
(assert (not (str.in_re X (re.++ ((_ re.loop 8 8) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "-") ((_ re.loop 4 4) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "-3") ((_ re.loop 3 3) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "-") (re.union (str.to_re "8") (str.to_re "9") (str.to_re "a") (str.to_re "b")) ((_ re.loop 3 3) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "-") ((_ re.loop 12 12) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "\u{a}")))))
; Test\d+DesktopAddressIDENTIFY666User-Agent\u{3A}\u{5B}Static
(assert (not (str.in_re X (re.++ (str.to_re "Test") (re.+ (re.range "0" "9")) (str.to_re "DesktopAddressIDENTIFY666User-Agent:[Static\u{a}")))))
; /filename=[^\n]*\u{2e}jmh/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".jmh/i\u{a}"))))
(check-sat)
