(set-logic QF_SLIA)
(declare-const X String)
; \stoolbar\.anwb\.nl\s+A-311\s+newsSoftActivitypassword\u{3B}1\u{3B}Optix
(assert (str.in_re X (re.++ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "toolbar.anwb.nl") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "A-311") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "newsSoftActivity\u{13}password;1;Optix\u{a}"))))
(check-sat)
