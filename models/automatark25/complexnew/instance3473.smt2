(set-logic QF_SLIA)
(declare-const X String)
; ^[1-9][0-9]{0,2}$
(assert (str.in_re X (re.++ (re.range "1" "9") ((_ re.loop 0 2) (re.range "0" "9")) (str.to_re "\u{a}"))))
; /\/[a-zA-Z_-]+\.ee$/U
(assert (str.in_re X (re.++ (str.to_re "//") (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (str.to_re "_") (str.to_re "-"))) (str.to_re ".ee/U\u{a}"))))
; Spy\-Locked\s+ExploiterSchwindler\u{2F}r\u{2F}keys\u{2F}keys
(assert (not (str.in_re X (re.++ (str.to_re "Spy-Locked") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "ExploiterSchwindler/r/keys/keys\u{a}")))))
; /[^ -~\r\n]{4}/P
(assert (str.in_re X (re.++ (str.to_re "/") ((_ re.loop 4 4) (re.union (re.range " " "~") (str.to_re "\u{d}") (str.to_re "\u{a}"))) (str.to_re "/P\u{a}"))))
; /SOAPAction\u{3A}\s*?\u{22}[^\u{22}\u{23}]+?\u{23}([^\u{22}]{2048}|[^\u{22}]+$)/Hsi
(assert (str.in_re X (re.++ (str.to_re "/SOAPAction:") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "\u{22}") (re.+ (re.union (str.to_re "\u{22}") (str.to_re "#"))) (str.to_re "#") (re.union ((_ re.loop 2048 2048) (re.comp (str.to_re "\u{22}"))) (re.+ (re.comp (str.to_re "\u{22}")))) (str.to_re "/Hsi\u{a}"))))
(check-sat)
