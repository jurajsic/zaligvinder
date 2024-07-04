(set-logic QF_SLIA)
(declare-const X String)
; \u{2F}bar_pl\u{2F}chk\.fcgiHWAEcom\u{2F}index\.php\?tpid=
(assert (str.in_re X (str.to_re "/bar_pl/chk.fcgiHWAEcom/index.php?tpid=\u{a}")))
; ^[-\w`~!@#$%^&*\(\)+={}|\[\]\\:";'<>?,.\/ ]*$
(assert (not (str.in_re X (re.++ (re.* (re.union (str.to_re "-") (str.to_re "`") (str.to_re "~") (str.to_re "!") (str.to_re "@") (str.to_re "#") (str.to_re "$") (str.to_re "%") (str.to_re "^") (str.to_re "&") (str.to_re "*") (str.to_re "(") (str.to_re ")") (str.to_re "+") (str.to_re "=") (str.to_re "{") (str.to_re "}") (str.to_re "|") (str.to_re "[") (str.to_re "]") (str.to_re "\u{5c}") (str.to_re ":") (str.to_re "\u{22}") (str.to_re ";") (str.to_re "'") (str.to_re "<") (str.to_re ">") (str.to_re "?") (str.to_re ",") (str.to_re ".") (str.to_re "/") (str.to_re " ") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "\u{a}")))))
; (((^[>]?1.0)(\d)?(\d)?)|(^[<]?1.0(([1-9])|(\d[1-9])|([1-9]\d)))|(^[<]?1.4(0)?(0)?)|(^[<>]?1.(([123])(\d)?(\d)?)))$
(assert (not (str.in_re X (re.++ (re.union (re.++ (re.opt (re.range "0" "9")) (re.opt (re.range "0" "9")) (re.opt (str.to_re ">")) (str.to_re "1") re.allchar (str.to_re "0")) (re.++ (re.opt (str.to_re "<")) (str.to_re "1") re.allchar (str.to_re "0") (re.union (re.range "1" "9") (re.++ (re.range "0" "9") (re.range "1" "9")) (re.++ (re.range "1" "9") (re.range "0" "9")))) (re.++ (re.opt (str.to_re "<")) (str.to_re "1") re.allchar (str.to_re "4") (re.opt (str.to_re "0")) (re.opt (str.to_re "0"))) (re.++ (re.opt (re.union (str.to_re "<") (str.to_re ">"))) (str.to_re "1") re.allchar (re.union (str.to_re "1") (str.to_re "2") (str.to_re "3")) (re.opt (re.range "0" "9")) (re.opt (re.range "0" "9")))) (str.to_re "\u{a}")))))
(check-sat)
