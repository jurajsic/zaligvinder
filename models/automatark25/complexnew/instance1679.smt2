(set-logic QF_SLIA)
(declare-const X String)
; isSAH\*Agentwww\.raxsearch\.comHost\u{3A}-~-\u{22}The
(assert (not (str.in_re X (str.to_re "isSAH*Agentwww.raxsearch.comHost:-~-\u{22}The\u{a}"))))
; (INSERT INTO\s+)(\w+)(\s+\()([\w+,?\s*]+)(\)\s+VALUES\s+)((\(['?\w+'?,?\s*]+\)\,?;?\s*)+)
(assert (not (str.in_re X (re.++ (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (re.+ (re.union (str.to_re "+") (str.to_re ",") (str.to_re "?") (str.to_re "*") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.+ (re.++ (str.to_re "(") (re.+ (re.union (str.to_re "'") (str.to_re "?") (str.to_re "+") (str.to_re ",") (str.to_re "*") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re ")") (re.opt (str.to_re ",")) (re.opt (str.to_re ";")) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))))) (str.to_re "\u{a}INSERT INTO") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "()") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "VALUES") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")))))))
; wjpropqmlpohj\u{2f}lo\s+media\u{2E}dxcdirect\u{2E}com
(assert (str.in_re X (re.++ (str.to_re "wjpropqmlpohj/lo") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "media.dxcdirect.com\u{a}"))))
; Host\u{3A}Host\u{3A}From\u{3a}\u{3}\u{0}\u{1c}\u{0}\u{0}\u{0}\u{0}\u{0}\u{1}Furaxbnymomspyo\u{2f}zowy
(assert (not (str.in_re X (str.to_re "Host:Host:From:\u{3}\u{0}\u{1c}\u{0}\u{0}\u{0}\u{0}\u{0}\u{1}Furaxbnymomspyo/zowy\u{a}"))))
(check-sat)
