(declare-const X String)
; ^[1-9][0-9]{3}$
(assert (not (str.in_re X (re.++ (re.range "1" "9") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "\u{a}")))))
; richfind\u{2E}comCookie\u{3a}Name=Your\+Host\+is\u{3A}
(assert (str.in_re X (str.to_re "richfind.comCookie:Name=Your+Host+is:\u{a}")))
; ^(\d{4},?)+$
(assert (str.in_re X (re.++ (re.+ (re.++ ((_ re.loop 4 4) (re.range "0" "9")) (re.opt (str.to_re ",")))) (str.to_re "\u{a}"))))
; (http(s?)://|[a-zA-Z0-9\-]+\.)[a-zA-Z0-9/~\-]+\.[a-zA-Z0-9/~\-_,&\?\.;]+[^\.,\s<]
(assert (not (str.in_re X (re.++ (re.union (re.++ (str.to_re "http") (re.opt (str.to_re "s")) (str.to_re "://")) (re.++ (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "-"))) (str.to_re "."))) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "/") (str.to_re "~") (str.to_re "-"))) (str.to_re ".") (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "/") (str.to_re "~") (str.to_re "-") (str.to_re "_") (str.to_re ",") (str.to_re "&") (str.to_re "?") (str.to_re ".") (str.to_re ";"))) (re.union (str.to_re ".") (str.to_re ",") (str.to_re "<") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "\u{a}")))))
; DaysLOGHost\u{3a}Host\u{3a}\u{7D}\u{7B}OS\u{3A}Host\u{3A}
(assert (str.in_re X (str.to_re "DaysLOGHost:Host:}{OS:Host:\u{a}")))
(check-sat)
