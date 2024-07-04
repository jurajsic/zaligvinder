(set-logic QF_SLIA)
(declare-const X String)
; ProjectHost\u{3A}logHost\u{3A}www\u{2E}snap\u{2E}comGoogle-\>rtServidor\u{2E}
(assert (str.in_re X (str.to_re "ProjectHost:logHost:www.snap.comGoogle->rtServidor.\u{13}\u{a}")))
; ^[a-zA-Z0-9][a-zA-Z0-9_]{2,29}$
(assert (str.in_re X (re.++ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9")) ((_ re.loop 2 29) (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_"))) (str.to_re "\u{a}"))))
; ^\d*[0-9](|.\d*[0-9]|)*$
(assert (str.in_re X (re.++ (re.* (re.range "0" "9")) (re.range "0" "9") (re.* (re.++ re.allchar (re.* (re.range "0" "9")) (re.range "0" "9"))) (str.to_re "\u{a}"))))
; OSSProxyHost\u{3A}Subject\u{3a}s_sq=aolsnssignin
(assert (str.in_re X (str.to_re "OSSProxyHost:Subject:s_sq=aolsnssignin\u{a}")))
; /^[a-z\d\u{2b}\u{2f}\u{3d}]{48,256}$/iP
(assert (str.in_re X (re.++ (str.to_re "/") ((_ re.loop 48 256) (re.union (re.range "a" "z") (re.range "0" "9") (str.to_re "+") (str.to_re "/") (str.to_re "="))) (str.to_re "/iP\u{a}"))))
(check-sat)
