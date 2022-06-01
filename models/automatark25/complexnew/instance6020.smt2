(declare-const X String)
; (\"http:\/\/www\.youtube\.com\/v\/\w{11}\&rel\=1\")
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}\u{22}http://www.youtube.com/v/") ((_ re.loop 11 11) (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "&rel=1\u{22}")))))
; User-Agent\u{3a}[^\n\r]*Echelon.*Blacksnprtz\u{7C}dialnoSearch
(assert (str.in_re X (re.++ (str.to_re "User-Agent:") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "Echelon") (re.* re.allchar) (str.to_re "Blacksnprtz|dialnoSearch\u{a}"))))
; /\u{2e}xpm([\?\u{5c}\u{2f}]|$)/smiU
(assert (not (str.in_re X (re.++ (str.to_re "/.xpm") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}")))))
; /^\/[a-z]{2,20}\.php\?[a-z]{2,10}\u{3d}[a-zA-Z0-9\u{2f}\u{2b}]+\u{3d}$/I
(assert (not (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 2 20) (re.range "a" "z")) (str.to_re ".php?") ((_ re.loop 2 10) (re.range "a" "z")) (str.to_re "=") (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "/") (str.to_re "+"))) (str.to_re "=/I\u{a}")))))
(check-sat)
