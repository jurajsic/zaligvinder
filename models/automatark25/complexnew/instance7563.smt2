(declare-const X String)
; /filename=[^\n]*\u{2e}xpm/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".xpm/i\u{a}"))))
; url=http\u{3A}GamespyjspIDENTIFYserverHOST\u{3A}Subject\u{3A}
(assert (str.in_re X (str.to_re "url=http:\u{1b}GamespyjspIDENTIFYserverHOST:Subject:\u{a}")))
; (^[a-fA-F]+[+-]?$)
(assert (str.in_re X (re.++ (str.to_re "\u{a}") (re.+ (re.union (re.range "a" "f") (re.range "A" "F"))) (re.opt (re.union (str.to_re "+") (str.to_re "-"))))))
; ^(\(\d{3}\)[- ]?|\d{3}[- ])?\d{3}[- ]\d{4}$
(assert (str.in_re X (re.++ (re.opt (re.union (re.++ (str.to_re "(") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re ")") (re.opt (re.union (str.to_re "-") (str.to_re " ")))) (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (re.union (str.to_re "-") (str.to_re " "))))) ((_ re.loop 3 3) (re.range "0" "9")) (re.union (str.to_re "-") (str.to_re " ")) ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}"))))
(check-sat)
