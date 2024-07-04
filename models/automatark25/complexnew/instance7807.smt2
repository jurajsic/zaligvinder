(set-logic QF_SLIA)
(declare-const X String)
; .*[Pp]re[Ss\$]cr[iI1]pt.*
(assert (not (str.in_re X (re.++ (re.* re.allchar) (re.union (str.to_re "P") (str.to_re "p")) (str.to_re "re") (re.union (str.to_re "S") (str.to_re "s") (str.to_re "$")) (str.to_re "cr") (re.union (str.to_re "i") (str.to_re "I") (str.to_re "1")) (str.to_re "pt") (re.* re.allchar) (str.to_re "\u{a}")))))
; ^([0-9]*|\d*\.\d{1}?\d*)$
(assert (not (str.in_re X (re.++ (re.union (re.* (re.range "0" "9")) (re.++ (re.* (re.range "0" "9")) (str.to_re ".") ((_ re.loop 1 1) (re.range "0" "9")) (re.* (re.range "0" "9")))) (str.to_re "\u{a}")))))
; /\u{2e}avi([\?\u{5c}\u{2f}]|$)/smiU
(assert (str.in_re X (re.++ (str.to_re "/.avi") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}"))))
; comLOGUser-Agent\u{3A}istsvcwww\u{2E}oemji\u{2E}comSystemSleuth
(assert (str.in_re X (str.to_re "comLOGUser-Agent:istsvcwww.oemji.comSystemSleuth\u{13}\u{a}")))
(check-sat)
