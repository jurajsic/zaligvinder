(declare-const X String)
; Host\u{3A}Informationwww\u{2E}zhongsou\u{2E}comLitequick\u{2E}qsrch\u{2E}com
(assert (str.in_re X (str.to_re "Host:Informationwww.zhongsou.comLitequick.qsrch.com\u{a}")))
; ^(\d{2,3}|\(\d{2,3}\))[ ]?\d{3,4}[-]?\d{3,4}$
(assert (str.in_re X (re.++ (re.union ((_ re.loop 2 3) (re.range "0" "9")) (re.++ (str.to_re "(") ((_ re.loop 2 3) (re.range "0" "9")) (str.to_re ")"))) (re.opt (str.to_re " ")) ((_ re.loop 3 4) (re.range "0" "9")) (re.opt (str.to_re "-")) ((_ re.loop 3 4) (re.range "0" "9")) (str.to_re "\u{a}"))))
; /filename=[^\n]*\u{2e}mswmm/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".mswmm/i\u{a}"))))
(check-sat)
