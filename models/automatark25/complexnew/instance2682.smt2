(set-logic QF_SLIA)
(declare-const X String)
; /\u{2e}met([\?\u{5c}\u{2f}]|$)/smiU
(assert (not (str.in_re X (re.++ (str.to_re "/.met") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}")))))
; /\.getElements?By(Id|TagName)\u{28}\s*[\u{22}\u{27}]caption[\u{22}\u{27}]\s*\u{29}.*?innerHTML\s*\u{3d}\s*[\u{22}\u{27}]\u{3c}thead/sm
(assert (str.in_re X (re.++ (str.to_re "/.getElement") (re.opt (str.to_re "s")) (str.to_re "By") (re.union (str.to_re "Id") (str.to_re "TagName")) (str.to_re "(") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.union (str.to_re "\u{22}") (str.to_re "'")) (str.to_re "caption") (re.union (str.to_re "\u{22}") (str.to_re "'")) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re ")") (re.* re.allchar) (str.to_re "innerHTML") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "=") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.union (str.to_re "\u{22}") (str.to_re "'")) (str.to_re "<thead/sm\u{a}"))))
(check-sat)
