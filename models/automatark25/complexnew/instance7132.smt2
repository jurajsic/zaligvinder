(set-logic QF_SLIA)
(declare-const X String)
; Toolbar\s+pjpoptwql\u{2f}rlnjSubject\u{3A}
(assert (str.in_re X (re.++ (str.to_re "Toolbar") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "pjpoptwql/rlnjSubject:\u{a}"))))
; <[^>\s]*\bauthor\b[^>]*>
(assert (not (str.in_re X (re.++ (str.to_re "<") (re.* (re.union (str.to_re ">") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "author") (re.* (re.comp (str.to_re ">"))) (str.to_re ">\u{a}")))))
(check-sat)
