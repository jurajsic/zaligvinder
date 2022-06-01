(declare-const X String)
; e2give\.com\s+adfsgecoiwnf\u{23}\u{23}\u{23}\u{23}User-Agent\u{3A}
(assert (not (str.in_re X (re.++ (str.to_re "e2give.com") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "adfsgecoiwnf\u{1b}####User-Agent:\u{a}")))))
; /filename=[^\n]*\u{2e}metalink/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".metalink/i\u{a}"))))
; /[^\u{20}-\u{7e}\r\n]{3}/P
(assert (str.in_re X (re.++ (str.to_re "/") ((_ re.loop 3 3) (re.union (re.range " " "~") (str.to_re "\u{d}") (str.to_re "\u{a}"))) (str.to_re "/P\u{a}"))))
; Agentppcdomain\u{2E}co\u{2E}ukWordSpy\-Locked
(assert (not (str.in_re X (str.to_re "Agentppcdomain.co.ukWordSpy-Locked\u{a}"))))
; /\u{3f}sv\u{3d}\d{1,3}\u{26}tq\u{3d}/smiU
(assert (str.in_re X (re.++ (str.to_re "/?sv=") ((_ re.loop 1 3) (re.range "0" "9")) (str.to_re "&tq=/smiU\u{a}"))))
(check-sat)
