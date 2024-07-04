(set-logic QF_SLIA)
(declare-const X String)
; s_sq=aolsnssignin.*LOG\s+Host\u{3A}Subject\u{3A}online-casino-searcher\.com
(assert (str.in_re X (re.++ (str.to_re "s_sq=aolsnssignin") (re.* re.allchar) (str.to_re "LOG") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Host:Subject:online-casino-searcher.com\u{a}"))))
; \d{2}[.]{1}\d{2}[.]{1}[0-9A-Za-z]{1}
(assert (str.in_re X (re.++ ((_ re.loop 2 2) (re.range "0" "9")) ((_ re.loop 1 1) (str.to_re ".")) ((_ re.loop 2 2) (re.range "0" "9")) ((_ re.loop 1 1) (str.to_re ".")) ((_ re.loop 1 1) (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z"))) (str.to_re "\u{a}"))))
; ^([\(]{1}[0-9]{3}[\)]{1}[ ]{1}[0-9]{3}[\-]{1}[0-9]{4})$
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") ((_ re.loop 1 1) (str.to_re "(")) ((_ re.loop 3 3) (re.range "0" "9")) ((_ re.loop 1 1) (str.to_re ")")) ((_ re.loop 1 1) (str.to_re " ")) ((_ re.loop 3 3) (re.range "0" "9")) ((_ re.loop 1 1) (str.to_re "-")) ((_ re.loop 4 4) (re.range "0" "9"))))))
(check-sat)
