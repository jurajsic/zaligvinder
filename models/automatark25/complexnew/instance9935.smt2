(set-logic QF_SLIA)
(declare-const X String)
; /\u{26}uid\u{3d}[a-f0-9]{16}($|\u{26})/U
(assert (str.in_re X (re.++ (str.to_re "/&uid=") ((_ re.loop 16 16) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "&/U\u{a}"))))
; /filename=[^\n]*\u{2e}m3u/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".m3u/i\u{a}")))))
; User-Agent\u{3A}etbuviaebe\u{2f}eqv\.bvv
(assert (not (str.in_re X (str.to_re "User-Agent:etbuviaebe/eqv.bvv\u{a}"))))
; /filename=[^\n]*\u{2e}abc/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".abc/i\u{a}"))))
(check-sat)
