(declare-const X String)
; URL\s+url=Host\u{3a}httpUser-Agent\u{3A}Subject\u{3A}
(assert (not (str.in_re X (re.++ (str.to_re "URL") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "url=Host:httpUser-Agent:Subject:\u{a}")))))
; ([A-Za-z0-9.]+\s*)+,
(assert (str.in_re X (re.++ (re.+ (re.++ (re.+ (re.union (re.range "A" "Z") (re.range "a" "z") (re.range "0" "9") (str.to_re "."))) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))))) (str.to_re ",\u{a}"))))
; /file=[\u{7c}\u{27}]/Ui
(assert (not (str.in_re X (re.++ (str.to_re "/file=") (re.union (str.to_re "|") (str.to_re "'")) (str.to_re "/Ui\u{a}")))))
; ^([1-zA-Z0-1@.\s]{1,255})$
(assert (not (str.in_re X (re.++ ((_ re.loop 1 255) (re.union (re.range "1" "z") (re.range "A" "Z") (re.range "0" "1") (str.to_re "@") (str.to_re ".") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "\u{a}")))))
(check-sat)
