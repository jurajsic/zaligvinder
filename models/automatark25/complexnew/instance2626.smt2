(set-logic QF_SLIA)
(declare-const X String)
; isSAH\*Agentwww\.raxsearch\.comHost\u{3A}-~-\u{22}The
(assert (str.in_re X (str.to_re "isSAH*Agentwww.raxsearch.comHost:-~-\u{22}The\u{a}")))
; var phonePattern = /^(([^\.\-\,a-wy-z]([\(]?(\+|[x])?\d+[\)]?)?[\s\.\-\,]?([\(]?\d+[\)]?)?[\s\.\-\,]?(\d+[\s\.\-\,]?)+[^\.\-\,a-z])|((\+|[x])?\d+))$/i
(assert (str.in_re X (re.++ (str.to_re "var phonePattern = /") (re.union (re.++ (re.union (str.to_re ".") (str.to_re "-") (str.to_re ",") (re.range "a" "w") (re.range "y" "z")) (re.opt (re.++ (re.opt (str.to_re "(")) (re.opt (re.union (str.to_re "+") (str.to_re "x"))) (re.+ (re.range "0" "9")) (re.opt (str.to_re ")")))) (re.opt (re.union (str.to_re ".") (str.to_re "-") (str.to_re ",") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.opt (re.++ (re.opt (str.to_re "(")) (re.+ (re.range "0" "9")) (re.opt (str.to_re ")")))) (re.opt (re.union (str.to_re ".") (str.to_re "-") (str.to_re ",") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.+ (re.++ (re.+ (re.range "0" "9")) (re.opt (re.union (str.to_re ".") (str.to_re "-") (str.to_re ",") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))))) (re.union (str.to_re ".") (str.to_re "-") (str.to_re ",") (re.range "a" "z"))) (re.++ (re.opt (re.union (str.to_re "+") (str.to_re "x"))) (re.+ (re.range "0" "9")))) (str.to_re "/i\u{a}"))))
; /[^&]+&[a-z]=[a-f0-9]{16}&[a-z]=[a-f0-9]{16}$/U
(assert (str.in_re X (re.++ (str.to_re "/") (re.+ (re.comp (str.to_re "&"))) (str.to_re "&") (re.range "a" "z") (str.to_re "=") ((_ re.loop 16 16) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "&") (re.range "a" "z") (str.to_re "=") ((_ re.loop 16 16) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "/U\u{a}"))))
; /\u{2f}1020\d{6,16}$/U
(assert (str.in_re X (re.++ (str.to_re "//1020") ((_ re.loop 6 16) (re.range "0" "9")) (str.to_re "/U\u{a}"))))
; ([A-Z]:\\[^/:\*;\/\:\?<>\|]+)|(\\{2}[^/:\*;\/\:\?<>\|]+)
(assert (str.in_re X (re.union (re.++ (re.range "A" "Z") (str.to_re ":\u{5c}") (re.+ (re.union (str.to_re "/") (str.to_re ":") (str.to_re "*") (str.to_re ";") (str.to_re "?") (str.to_re "<") (str.to_re ">") (str.to_re "|")))) (re.++ (str.to_re "\u{a}") ((_ re.loop 2 2) (str.to_re "\u{5c}")) (re.+ (re.union (str.to_re "/") (str.to_re ":") (str.to_re "*") (str.to_re ";") (str.to_re "?") (str.to_re "<") (str.to_re ">") (str.to_re "|")))))))
(check-sat)
