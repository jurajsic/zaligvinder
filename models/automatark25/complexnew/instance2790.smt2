(set-logic QF_SLIA)
(declare-const X String)
; /filename=[^\n]*\u{2e}exe/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".exe/i\u{a}")))))
; /filename=[^\n]*\u{2e}rtx/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".rtx/i\u{a}"))))
(check-sat)
