(declare-const X String)
; Toolbar[^\n\r]*tvshowtickets\w+weatherHost\u{3A}User-Agent\u{3A}twfofrfzlugq\u{2f}eve\.qd
(assert (str.in_re X (re.++ (str.to_re "Toolbar") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "tvshowtickets") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "weatherHost:User-Agent:twfofrfzlugq/eve.qd\u{a}"))))
; /filename=[^\n]*\u{2e}rmp/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".rmp/i\u{a}"))))
; ^(([1-9]{1}(\d+)?)(\.\d+)?)|([0]\.(\d+)?([1-9]{1})(\d+)?)$
(assert (not (str.in_re X (re.union (re.++ (re.opt (re.++ (str.to_re ".") (re.+ (re.range "0" "9")))) ((_ re.loop 1 1) (re.range "1" "9")) (re.opt (re.+ (re.range "0" "9")))) (re.++ (str.to_re "\u{a}0.") (re.opt (re.+ (re.range "0" "9"))) ((_ re.loop 1 1) (re.range "1" "9")) (re.opt (re.+ (re.range "0" "9"))))))))
(check-sat)
