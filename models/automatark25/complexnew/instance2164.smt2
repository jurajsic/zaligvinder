(declare-const X String)
; UI2AgentConnectedDesktopSubject\u{3A}ixqshv\u{2f}qzccsactualnames\.com
(assert (not (str.in_re X (str.to_re "UI2AgentConnectedDesktopSubject:ixqshv/qzccsactualnames.com\u{a}"))))
; /\u{28}\u{3f}\u{3d}[^)]{300}/
(assert (str.in_re X (re.++ (str.to_re "/(?=") ((_ re.loop 300 300) (re.comp (str.to_re ")"))) (str.to_re "/\u{a}"))))
(check-sat)
