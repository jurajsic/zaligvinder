(set-logic QF_SLIA)
(declare-const X String)
; UI2AgentConnectedDesktopSubject\u{3A}ixqshv\u{2f}qzccsactualnames\.com
(assert (str.in_re X (str.to_re "UI2AgentConnectedDesktopSubject:ixqshv/qzccsactualnames.com\u{a}")))
; /<\s*col[^>]*width\s*=\s*[\u{22}\u{27}]?\d{7}/i
(assert (str.in_re X (re.++ (str.to_re "/<") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "col") (re.* (re.comp (str.to_re ">"))) (str.to_re "width") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "=") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.opt (re.union (str.to_re "\u{22}") (str.to_re "'"))) ((_ re.loop 7 7) (re.range "0" "9")) (str.to_re "/i\u{a}"))))
(check-sat)
