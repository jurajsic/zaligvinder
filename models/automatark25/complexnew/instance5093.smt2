(declare-const X String)
; /filename=[^\n]*\u{2e}addin/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".addin/i\u{a}"))))
; [0-9]+|-[0-9]+
(assert (not (str.in_re X (re.union (re.+ (re.range "0" "9")) (re.++ (str.to_re "-") (re.+ (re.range "0" "9")) (str.to_re "\u{a}"))))))
; [+]346[0-9]{8}
(assert (str.in_re X (re.++ (str.to_re "+346") ((_ re.loop 8 8) (re.range "0" "9")) (str.to_re "\u{a}"))))
(check-sat)
