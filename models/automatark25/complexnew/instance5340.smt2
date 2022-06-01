(declare-const X String)
; \d{3}[.-]?\d{3}[.-]?\d{4}
(assert (str.in_re X (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to_re ".") (str.to_re "-"))) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to_re ".") (str.to_re "-"))) ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}"))))
; horoscope2YAHOOwww\u{2e}2-seek\u{2e}com\u{2f}searchHost\u{3A}
(assert (not (str.in_re X (str.to_re "horoscope2YAHOOwww.2-seek.com/searchHost:\u{a}"))))
; ^(389)[0-9]{11}$
(assert (str.in_re X (re.++ (str.to_re "389") ((_ re.loop 11 11) (re.range "0" "9")) (str.to_re "\u{a}"))))
; /<\s*col[^>]*width\s*=\s*[\u{22}\u{27}]?\d{7}/i
(assert (str.in_re X (re.++ (str.to_re "/<") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "col") (re.* (re.comp (str.to_re ">"))) (str.to_re "width") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "=") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.opt (re.union (str.to_re "\u{22}") (str.to_re "'"))) ((_ re.loop 7 7) (re.range "0" "9")) (str.to_re "/i\u{a}"))))
(check-sat)
