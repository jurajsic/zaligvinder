(declare-const X String)
; ^.+\@.+\..+$
(assert (not (str.in_re X (re.++ (re.+ re.allchar) (str.to_re "@") (re.+ re.allchar) (str.to_re ".") (re.+ re.allchar) (str.to_re "\u{a}")))))
; /filename=[^\n]*\u{2e}cpe/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".cpe/i\u{a}"))))
; ^([a-zA-Z]{5})([a-zA-Z0-9-]{3,12})
(assert (str.in_re X (re.++ ((_ re.loop 5 5) (re.union (re.range "a" "z") (re.range "A" "Z"))) ((_ re.loop 3 12) (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "-"))) (str.to_re "\u{a}"))))
; /((\d){2})?(\s|-)?((\d){2,4})?(\s|-){1}((\d){8})$/
(assert (not (str.in_re X (re.++ (str.to_re "/") (re.opt ((_ re.loop 2 2) (re.range "0" "9"))) (re.opt (re.union (str.to_re "-") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.opt ((_ re.loop 2 4) (re.range "0" "9"))) ((_ re.loop 1 1) (re.union (str.to_re "-") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 8 8) (re.range "0" "9")) (str.to_re "/\u{a}")))))
; www\u{2E}purityscan\u{2E}com\s+from\.myway\.comToolbarUI2
(assert (str.in_re X (re.++ (str.to_re "www.purityscan.com") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "from.myway.com\u{1b}ToolbarUI2\u{a}"))))
(check-sat)
