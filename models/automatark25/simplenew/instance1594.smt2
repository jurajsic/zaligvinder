(set-logic QF_SLIA)
(declare-const X String)
; /filename=[^\n]*\u{2e}flac/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".flac/i\u{a}")))))
(check-sat)
