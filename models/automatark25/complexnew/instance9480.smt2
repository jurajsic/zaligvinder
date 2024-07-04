(set-logic QF_SLIA)
(declare-const X String)
; \D
(assert (not (str.in_re X (re.++ (re.comp (re.range "0" "9")) (str.to_re "\u{a}")))))
; User-Agent\u{3A}From\u{3A}www\u{2E}onlinecasinoextra\u{2E}comHost\u{3A}
(assert (str.in_re X (str.to_re "User-Agent:From:www.onlinecasinoextra.comHost:\u{a}")))
; ^[0-3][0-9][0-1]\d{3}-\d{4}?
(assert (not (str.in_re X (re.++ (re.range "0" "3") (re.range "0" "9") (re.range "0" "1") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}")))))
(check-sat)
