(set-logic QF_SLIA)
(declare-const X String)
; /\/software\u{2e}php\u{3f}[0-9]{15,}/Ui
(assert (str.in_re X (re.++ (str.to_re "//software.php?/Ui\u{a}") ((_ re.loop 15 15) (re.range "0" "9")) (re.* (re.range "0" "9")))))
; \u{2F}rss\d+answer\sHost\u{3A}
(assert (str.in_re X (re.++ (str.to_re "/rss") (re.+ (re.range "0" "9")) (str.to_re "answer") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "Host:\u{a}"))))
; [0-7]+
(assert (str.in_re X (re.++ (re.+ (re.range "0" "7")) (str.to_re "\u{a}"))))
; ^\d{2}\s{1}(Jan|Feb|Mar|Apr|May|Jun|Jul|Apr|Sep|Oct|Nov|Dec)\s{1}\d{4}$
(assert (not (str.in_re X (re.++ ((_ re.loop 2 2) (re.range "0" "9")) ((_ re.loop 1 1) (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.union (str.to_re "Jan") (str.to_re "Feb") (str.to_re "Mar") (str.to_re "Apr") (str.to_re "May") (str.to_re "Jun") (str.to_re "Jul") (str.to_re "Apr") (str.to_re "Sep") (str.to_re "Oct") (str.to_re "Nov") (str.to_re "Dec")) ((_ re.loop 1 1) (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}")))))
; (jar:)?file:/(([A-Z]:)?/([A-Z0-9\*\()\+\-\&$#@_.!~\[\]/])+)((/[A-Z0-9_()\[\]\-=\+_~]+\.jar!)|([^!])(/com/regexlib/example/))
(assert (str.in_re X (re.++ (re.opt (str.to_re "jar:")) (str.to_re "file:/") (re.union (re.++ (str.to_re "/") (re.+ (re.union (re.range "A" "Z") (re.range "0" "9") (str.to_re "_") (str.to_re "(") (str.to_re ")") (str.to_re "[") (str.to_re "]") (str.to_re "-") (str.to_re "=") (str.to_re "+") (str.to_re "~"))) (str.to_re ".jar!")) (re.++ (re.comp (str.to_re "!")) (str.to_re "/com/regexlib/example/"))) (str.to_re "\u{a}") (re.opt (re.++ (re.range "A" "Z") (str.to_re ":"))) (str.to_re "/") (re.+ (re.union (re.range "A" "Z") (re.range "0" "9") (str.to_re "*") (str.to_re "(") (str.to_re ")") (str.to_re "+") (str.to_re "-") (str.to_re "&") (str.to_re "$") (str.to_re "#") (str.to_re "@") (str.to_re "_") (str.to_re ".") (str.to_re "!") (str.to_re "~") (str.to_re "[") (str.to_re "]") (str.to_re "/"))))))
(check-sat)
