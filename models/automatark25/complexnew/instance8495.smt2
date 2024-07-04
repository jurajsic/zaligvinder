(set-logic QF_SLIA)
(declare-const X String)
; ^[^_.]([a-zA-Z0-9_]*[.]?[a-zA-Z0-9_]+[^_]){2}@{1}[a-z0-9]+[.]{1}(([a-z]{2,3})|([a-z]{2,3}[.]{1}[a-z]{2,3}))$
(assert (not (str.in_re X (re.++ (re.union (str.to_re "_") (str.to_re ".")) ((_ re.loop 2 2) (re.++ (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_"))) (re.opt (str.to_re ".")) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_"))) (re.comp (str.to_re "_")))) ((_ re.loop 1 1) (str.to_re "@")) (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) ((_ re.loop 1 1) (str.to_re ".")) (re.union ((_ re.loop 2 3) (re.range "a" "z")) (re.++ ((_ re.loop 2 3) (re.range "a" "z")) ((_ re.loop 1 1) (str.to_re ".")) ((_ re.loop 2 3) (re.range "a" "z")))) (str.to_re "\u{a}")))))
; Subject\u{3A}.*User-Agent\u{3A}.*ResultATTENTION\u{3A}
(assert (str.in_re X (re.++ (str.to_re "Subject:") (re.* re.allchar) (str.to_re "User-Agent:") (re.* re.allchar) (str.to_re "ResultATTENTION:\u{a}"))))
; / \u{2D} .{1,20}\u{7}(LAN|PROXY|MODEM|MODEM BUSY|UNKNOWN)\u{7}Win/
(assert (str.in_re X (re.++ (str.to_re "/ - ") ((_ re.loop 1 20) re.allchar) (str.to_re "\u{7}") (re.union (str.to_re "LAN") (str.to_re "PROXY") (str.to_re "MODEM") (str.to_re "MODEM BUSY") (str.to_re "UNKNOWN")) (str.to_re "\u{7}Win/\u{a}"))))
; /filename=[^\n]*\u{2e}csd/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".csd/i\u{a}"))))
(check-sat)
