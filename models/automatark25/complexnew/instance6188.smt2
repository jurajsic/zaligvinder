(set-logic QF_SLIA)
(declare-const X String)
; /(USER|NICK)\u{20}BOSS\u{2d}[A-Z0-9\u{5b}\u{5d}\u{2d}]{15}/
(assert (str.in_re X (re.++ (str.to_re "/") (re.union (str.to_re "USER") (str.to_re "NICK")) (str.to_re " BOSS-") ((_ re.loop 15 15) (re.union (re.range "A" "Z") (re.range "0" "9") (str.to_re "[") (str.to_re "]") (str.to_re "-"))) (str.to_re "/\u{a}"))))
; /filename=[^\n]*\u{2e}met/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".met/i\u{a}"))))
(check-sat)
