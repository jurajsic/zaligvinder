(set-logic QF_SLIA)
(declare-const X String)
; Prodaosearch\u{2E}comReferer\u{3A}007User-Agent\u{3A}
(assert (str.in_re X (str.to_re "Prodaosearch.comReferer:007User-Agent:\u{a}")))
; Toolbar[^\n\r]*tvshowtickets\w+weatherHost\u{3A}User-Agent\u{3A}twfofrfzlugq\u{2f}eve\.qd
(assert (not (str.in_re X (re.++ (str.to_re "Toolbar") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "tvshowtickets") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "weatherHost:User-Agent:twfofrfzlugq/eve.qd\u{a}")))))
(check-sat)
