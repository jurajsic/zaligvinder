(declare-const X String)
; /\u{2f}[a-z-_]{90,}\u{2e}(html|php)$/U
(assert (not (str.in_re X (re.++ (str.to_re "//.") (re.union (str.to_re "html") (str.to_re "php")) (str.to_re "/U\u{a}") ((_ re.loop 90 90) (re.union (re.range "a" "z") (str.to_re "-") (str.to_re "_"))) (re.* (re.union (re.range "a" "z") (str.to_re "-") (str.to_re "_")))))))
; /filename=[^\n]*\u{2e}hhk/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".hhk/i\u{a}")))))
; /filename=[^\n]*\u{2e}dvr-ms/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".dvr-ms/i\u{a}")))))
; /^([0-2]\d\d){75}/P
(assert (not (str.in_re X (re.++ (str.to_re "/") ((_ re.loop 75 75) (re.++ (re.range "0" "2") (re.range "0" "9") (re.range "0" "9"))) (str.to_re "/P\u{a}")))))
; /filename=[^\n]*\u{2e}jp2/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".jp2/i\u{a}")))))
(check-sat)
