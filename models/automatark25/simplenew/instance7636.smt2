(declare-const X String)
; ("[^"]*")|('[^\r]*)(\r\n)?
(assert (str.in_re X (re.union (re.++ (str.to_re "\u{22}") (re.* (re.comp (str.to_re "\u{22}"))) (str.to_re "\u{22}")) (re.++ (re.opt (str.to_re "\u{d}\u{a}")) (str.to_re "\u{a}'") (re.* (re.comp (str.to_re "\u{d}")))))))
(check-sat)
