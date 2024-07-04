(set-logic QF_SLIA)
(declare-const X String)
; www\u{2E}onlinecasinoextra\u{2E}comWindows
(assert (not (str.in_re X (str.to_re "www.onlinecasinoextra.comWindows\u{a}"))))
; \d{10,12}@[a-zA-Z].[a-zA-Z].*
(assert (not (str.in_re X (re.++ ((_ re.loop 10 12) (re.range "0" "9")) (str.to_re "@") (re.union (re.range "a" "z") (re.range "A" "Z")) re.allchar (re.union (re.range "a" "z") (re.range "A" "Z")) (re.* re.allchar) (str.to_re "\u{a}")))))
; /\u{2e}mcl([\u{3f}\u{2f}]|$)/Uim
(assert (not (str.in_re X (re.++ (str.to_re "/.mcl") (re.union (str.to_re "?") (str.to_re "/")) (str.to_re "/Uim\u{a}")))))
; ^[a-zA-Z]([a-zA-Z[._][\d]])*[@][a-zA-Z[.][\d]]*[.][a-z[.][\d]]*
(assert (not (str.in_re X (re.++ (re.union (re.range "a" "z") (re.range "A" "Z")) (re.* (re.++ (re.union (re.range "a" "z") (re.range "A" "Z") (str.to_re "[") (str.to_re ".") (str.to_re "_")) (re.range "0" "9") (str.to_re "]"))) (str.to_re "@") (re.union (re.range "a" "z") (re.range "A" "Z") (str.to_re "[") (str.to_re ".")) (re.range "0" "9") (re.* (str.to_re "]")) (str.to_re ".") (re.union (re.range "a" "z") (str.to_re "[") (str.to_re ".")) (re.range "0" "9") (re.* (str.to_re "]")) (str.to_re "\u{a}")))))
; Referer\u{3A}.*notification.*qisezhin\u{2f}iqor\.ymspasServer\u{3a}
(assert (str.in_re X (re.++ (str.to_re "Referer:") (re.* re.allchar) (str.to_re "notification\u{13}") (re.* re.allchar) (str.to_re "qisezhin/iqor.ym\u{13}spasServer:\u{a}"))))
(check-sat)
