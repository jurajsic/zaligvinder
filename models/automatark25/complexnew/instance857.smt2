(declare-const X String)
; /^.{27}/sR
(assert (str.in_re X (re.++ (str.to_re "/") ((_ re.loop 27 27) re.allchar) (str.to_re "/sR\u{a}"))))
; /filename=[^\n]*\u{2e}zip/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".zip/i\u{a}"))))
; \d\d?\d?\.\d\d?\d?\.\d\d?\d?\.\d\d?\d?
(assert (not (str.in_re X (re.++ (re.range "0" "9") (re.opt (re.range "0" "9")) (re.opt (re.range "0" "9")) (str.to_re ".") (re.range "0" "9") (re.opt (re.range "0" "9")) (re.opt (re.range "0" "9")) (str.to_re ".") (re.range "0" "9") (re.opt (re.range "0" "9")) (re.opt (re.range "0" "9")) (str.to_re ".") (re.range "0" "9") (re.opt (re.range "0" "9")) (re.opt (re.range "0" "9")) (str.to_re "\u{a}")))))
; ^[ \w]{3,}([A-Za-z]\.)?([ \w]*\#\d+)?(\r\n| )[ \w]{3,},\u{20}[A-Za-z]{2}\u{20}\d{5}(-\d{4})?$
(assert (str.in_re X (re.++ (re.opt (re.++ (re.union (re.range "A" "Z") (re.range "a" "z")) (str.to_re "."))) (re.opt (re.++ (re.* (re.union (str.to_re " ") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "#") (re.+ (re.range "0" "9")))) (re.union (str.to_re "\u{d}\u{a}") (str.to_re " ")) (str.to_re ", ") ((_ re.loop 2 2) (re.union (re.range "A" "Z") (re.range "a" "z"))) (str.to_re " ") ((_ re.loop 5 5) (re.range "0" "9")) (re.opt (re.++ (str.to_re "-") ((_ re.loop 4 4) (re.range "0" "9")))) (str.to_re "\u{a}") ((_ re.loop 3 3) (re.union (str.to_re " ") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (re.* (re.union (str.to_re " ") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) ((_ re.loop 3 3) (re.union (str.to_re " ") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (re.* (re.union (str.to_re " ") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))))))
(check-sat)
