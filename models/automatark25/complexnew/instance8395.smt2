(declare-const X String)
; (([A-Z]{1,2}[0-9][0-9A-Z]?)\ ([0-9][A-Z]{2}))|(GIR\ 0AA)
(assert (str.in_re X (re.union (re.++ (str.to_re " ") ((_ re.loop 1 2) (re.range "A" "Z")) (re.range "0" "9") (re.opt (re.union (re.range "0" "9") (re.range "A" "Z"))) (re.range "0" "9") ((_ re.loop 2 2) (re.range "A" "Z"))) (str.to_re "GIR 0AA\u{a}"))))
; [+-]*[0-9]+[,]*[0-9]*|[+-]*[0-9]*[,]+[0-9]*
(assert (str.in_re X (re.union (re.++ (re.* (re.union (str.to_re "+") (str.to_re "-"))) (re.+ (re.range "0" "9")) (re.* (str.to_re ",")) (re.* (re.range "0" "9"))) (re.++ (re.* (re.union (str.to_re "+") (str.to_re "-"))) (re.* (re.range "0" "9")) (re.+ (str.to_re ",")) (re.* (re.range "0" "9")) (str.to_re "\u{a}")))))
; Subject\u{3A}linkautomatici\u{2E}comReferer\u{3A}www\u{2E}searchreslt\u{2E}com
(assert (not (str.in_re X (str.to_re "Subject:linkautomatici.comReferer:www.searchreslt.com\u{a}"))))
; ^\d*[0-9](\.\d?[0-9])?$
(assert (not (str.in_re X (re.++ (re.* (re.range "0" "9")) (re.range "0" "9") (re.opt (re.++ (str.to_re ".") (re.opt (re.range "0" "9")) (re.range "0" "9"))) (str.to_re "\u{a}")))))
(check-sat)
