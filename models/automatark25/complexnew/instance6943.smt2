(declare-const X String)
; (?i:[aeiou]+)\B
(assert (not (str.in_re X (re.++ (re.+ (re.union (str.to_re "a") (str.to_re "e") (str.to_re "i") (str.to_re "o") (str.to_re "u"))) (str.to_re "\u{a}")))))
; (< *balise[ *>|:(.|\n)*>| (.|\n)*>](.|\n)*</balise *>)
(assert (str.in_re X (re.++ (str.to_re "\u{a}<") (re.* (str.to_re " ")) (str.to_re "balise") (re.union (str.to_re " ") (str.to_re "*") (str.to_re ">") (str.to_re "|") (str.to_re ":") (str.to_re "(") (str.to_re ".") (str.to_re "\u{a}") (str.to_re ")")) (re.* (re.union re.allchar (str.to_re "\u{a}"))) (str.to_re "</balise") (re.* (str.to_re " ")) (str.to_re ">"))))
; ^[http|ftp|wap|https]{3,5}:\//\www\.\w*\.[com|net]{2,3}$
(assert (str.in_re X (re.++ ((_ re.loop 3 5) (re.union (str.to_re "h") (str.to_re "t") (str.to_re "p") (str.to_re "|") (str.to_re "f") (str.to_re "w") (str.to_re "a") (str.to_re "s"))) (str.to_re "://") (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_")) (str.to_re "ww.") (re.* (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re ".") ((_ re.loop 2 3) (re.union (str.to_re "c") (str.to_re "o") (str.to_re "m") (str.to_re "|") (str.to_re "n") (str.to_re "e") (str.to_re "t"))) (str.to_re "\u{a}"))))
; (^\*\.[a-zA-Z][a-zA-Z][a-zA-Z]$)|(^\*\.\*$)
(assert (not (str.in_re X (re.union (re.++ (str.to_re "*.") (re.union (re.range "a" "z") (re.range "A" "Z")) (re.union (re.range "a" "z") (re.range "A" "Z")) (re.union (re.range "a" "z") (re.range "A" "Z"))) (str.to_re "*.*\u{a}")))))
(check-sat)
