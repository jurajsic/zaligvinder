(set-logic QF_SLIA)
(declare-const X String)
; /filename=[^\n]*\u{2e}metalink/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".metalink/i\u{a}")))))
; ^([a-z]{2,3}(\.[a-zA-Z][a-zA-Z_$0-9]*)*)\.([A-Z][a-zA-Z_$0-9]*)$
(assert (str.in_re X (re.++ (str.to_re ".\u{a}") ((_ re.loop 2 3) (re.range "a" "z")) (re.* (re.++ (str.to_re ".") (re.union (re.range "a" "z") (re.range "A" "Z")) (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (str.to_re "_") (str.to_re "$") (re.range "0" "9"))))) (re.range "A" "Z") (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (str.to_re "_") (str.to_re "$") (re.range "0" "9"))))))
; /filename\s*=\s*[^\r\n]*?\u{2e}swf[\u{22}\u{27}\u{3b}\s\r\n]/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "=") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.* (re.union (str.to_re "\u{d}") (str.to_re "\u{a}"))) (str.to_re ".swf") (re.union (str.to_re "\u{22}") (str.to_re "'") (str.to_re ";") (str.to_re "\u{d}") (str.to_re "\u{a}") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "/i\u{a}")))))
; ^(eth[0-9]$)|(^eth[0-9]:[1-9]$)
(assert (not (str.in_re X (re.union (re.++ (str.to_re "eth") (re.range "0" "9")) (re.++ (str.to_re "\u{a}eth") (re.range "0" "9") (str.to_re ":") (re.range "1" "9"))))))
; /filename=[^\n]*\u{2e}wmf/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".wmf/i\u{a}")))))
(check-sat)
