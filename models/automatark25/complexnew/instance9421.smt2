(declare-const X String)
; /filename=[^\n]*\u{2e}lzh/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".lzh/i\u{a}"))))
; ^([1-9]|[1-9]\d|100)$
(assert (str.in_re X (re.++ (re.union (re.range "1" "9") (re.++ (re.range "1" "9") (re.range "0" "9")) (str.to_re "100")) (str.to_re "\u{a}"))))
; 1\-extreme\u{2E}bizasdbiz\u{2E}bizfrom\u{7c}roogoo\u{7c}CurrentiOpus
(assert (str.in_re X (str.to_re "1-extreme.bizasdbiz.bizfrom|roogoo|CurrentiOpus\u{a}")))
; /^\d{0,10}_passes_\d{1,10}\.xm/iR
(assert (not (str.in_re X (re.++ (str.to_re "/") ((_ re.loop 0 10) (re.range "0" "9")) (str.to_re "_passes_") ((_ re.loop 1 10) (re.range "0" "9")) (str.to_re ".xm/iR\u{a}")))))
(check-sat)
