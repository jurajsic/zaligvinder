(declare-const X String)
; /^\/[a-f0-9]{8}\.js\?cp\u{3d}/Umi
(assert (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 8 8) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re ".js?cp=/Umi\u{a}"))))
(check-sat)
