(set-logic QF_SLIA)
(declare-const X String)
; User-Agent\u{3A}\s+GET.*toowww\.123mania\.com
(assert (str.in_re X (re.++ (str.to_re "User-Agent:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "GET") (re.* re.allchar) (str.to_re "toowww.123mania.com\u{a}"))))
; /filename=[^\n]*\u{2e}pfb/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".pfb/i\u{a}")))))
(check-sat)
