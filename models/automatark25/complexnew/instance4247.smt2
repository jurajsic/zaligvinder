(set-logic QF_SLIA)
(declare-const X String)
; info\s+wjpropqmlpohj\u{2f}lo\s+resultsmaster\u{2E}com\u{7c}roogoo\u{7c}
(assert (str.in_re X (re.++ (str.to_re "info") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "wjpropqmlpohj/lo") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "resultsmaster.com\u{13}|roogoo|\u{a}"))))
; /\.php\u{3f}w\u{3d}\d+\u{26}n\u{3d}\d+/U
(assert (not (str.in_re X (re.++ (str.to_re "/.php?w=") (re.+ (re.range "0" "9")) (str.to_re "&n=") (re.+ (re.range "0" "9")) (str.to_re "/U\u{a}")))))
; start\s*([^$]*)\s*(.*?)
(assert (not (str.in_re X (re.++ (str.to_re "start") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.* (re.comp (str.to_re "$"))) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.* re.allchar) (str.to_re "\u{a}")))))
; ^[0-9#\*abcdABCD]+$
(assert (not (str.in_re X (re.++ (re.+ (re.union (re.range "0" "9") (str.to_re "#") (str.to_re "*") (str.to_re "a") (str.to_re "b") (str.to_re "c") (str.to_re "d") (str.to_re "A") (str.to_re "B") (str.to_re "C") (str.to_re "D"))) (str.to_re "\u{a}")))))
; /\.gif\u{3f}[a-f0-9]{4,7}\u{3d}\d{6,8}$/U
(assert (str.in_re X (re.++ (str.to_re "/.gif?") ((_ re.loop 4 7) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "=") ((_ re.loop 6 8) (re.range "0" "9")) (str.to_re "/U\u{a}"))))
(check-sat)
