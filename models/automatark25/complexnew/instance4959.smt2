(set-logic QF_SLIA)
(declare-const X String)
; /Referer\u{3a}\s*?http\u{3a}\u{2f}{2}[a-z0-9\u{2e}\u{2d}]+\u{2f}s\u{2f}\u{3f}k\u{3d}/Hi
(assert (not (str.in_re X (re.++ (str.to_re "/Referer:") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "http:") ((_ re.loop 2 2) (str.to_re "/")) (re.+ (re.union (re.range "a" "z") (re.range "0" "9") (str.to_re ".") (str.to_re "-"))) (str.to_re "/s/?k=/Hi\u{a}")))))
; /("(\\["\\]|[^"])*("|$)|\S)+/g
(assert (str.in_re X (re.++ (str.to_re "/") (re.+ (re.union (re.++ (str.to_re "\u{22}") (re.* (re.union (re.++ (str.to_re "\u{5c}") (re.union (str.to_re "\u{22}") (str.to_re "\u{5c}"))) (re.comp (str.to_re "\u{22}")))) (str.to_re "\u{22}")) (re.comp (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))))) (str.to_re "/g\u{a}"))))
; Host\u{3A}as\u{2E}starware\u{2E}com\u{2F}dp\u{2F}search\?x=
(assert (not (str.in_re X (str.to_re "Host:as.starware.com/dp/search?x=\u{a}"))))
; /^\/[\w-]{48}\.[a-z]{2,8}[0-9]?$/U
(assert (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 48 48) (re.union (str.to_re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re ".") ((_ re.loop 2 8) (re.range "a" "z")) (re.opt (re.range "0" "9")) (str.to_re "/U\u{a}"))))
; /filename=[^\n]*\u{2e}wmv/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".wmv/i\u{a}")))))
(check-sat)
