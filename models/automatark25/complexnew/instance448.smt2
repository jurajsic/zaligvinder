(declare-const X String)
; subject\u{3A}node=LoginNSIS_DOWNLOAD
(assert (str.in_re X (str.to_re "subject:node=LoginNSIS_DOWNLOAD\u{a}")))
; /[^&]+&[a-z]=[a-f0-9]{16}&[a-z]=[a-f0-9]{16}$/U
(assert (not (str.in_re X (re.++ (str.to_re "/") (re.+ (re.comp (str.to_re "&"))) (str.to_re "&") (re.range "a" "z") (str.to_re "=") ((_ re.loop 16 16) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "&") (re.range "a" "z") (str.to_re "=") ((_ re.loop 16 16) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "/U\u{a}")))))
(check-sat)
