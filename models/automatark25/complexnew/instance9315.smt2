(declare-const X String)
; Netspy\s\u{3A}auto\u{2E}isearch\u{2E}comUser-Agent\u{3A}aohobygi\u{2f}zwiwHWAEfhfksjzsfu\u{2f}ahm\.uqs
(assert (not (str.in_re X (re.++ (str.to_re "Netspy") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re ":auto.isearch.comUser-Agent:aohobygi/zwiwHWAEfhfksjzsfu/ahm.uqs\u{a}")))))
; /filename=[^\n]*\u{2e}amf/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".amf/i\u{a}")))))
; ^<\s*(td|TD)\s*(\w|\W)*\s*>(\w|\W)*</(td|TD)>$
(assert (not (str.in_re X (re.++ (str.to_re "<") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.union (str.to_re "td") (str.to_re "TD")) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.* (re.union (re.comp (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re ">") (re.* (re.union (re.comp (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "</") (re.union (str.to_re "td") (str.to_re "TD")) (str.to_re ">\u{a}")))))
; \d{10,12}@[a-zA-Z].[a-zA-Z].*
(assert (str.in_re X (re.++ ((_ re.loop 10 12) (re.range "0" "9")) (str.to_re "@") (re.union (re.range "a" "z") (re.range "A" "Z")) re.allchar (re.union (re.range "a" "z") (re.range "A" "Z")) (re.* re.allchar) (str.to_re "\u{a}"))))
; &#([0-9]{1,5}|x[0-9a-fA-F]{1,4});
(assert (not (str.in_re X (re.++ (str.to_re "&#") (re.union ((_ re.loop 1 5) (re.range "0" "9")) (re.++ (str.to_re "x") ((_ re.loop 1 4) (re.union (re.range "0" "9") (re.range "a" "f") (re.range "A" "F"))))) (str.to_re ";\u{a}")))))
(check-sat)
