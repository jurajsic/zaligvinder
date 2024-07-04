(set-logic QF_SLIA)
(declare-const X String)
; IDENTIFY.*\u{2F}ezsb\d+X-Mailer\u{3A}
(assert (not (str.in_re X (re.++ (str.to_re "IDENTIFY") (re.* re.allchar) (str.to_re "/ezsb") (re.+ (re.range "0" "9")) (str.to_re "X-Mailer:\u{13}\u{a}")))))
; /HTTP\/1.[01]\r\nUser\u{2d}Agent\u{3a}\u{20}[ -~]+\r\nHost\u{3a}\u{20}[a-z0-9\u{2d}\u{2e}]+\.info\r\n/
(assert (not (str.in_re X (re.++ (str.to_re "/HTTP/1") re.allchar (re.union (str.to_re "0") (str.to_re "1")) (str.to_re "\u{d}\u{a}User-Agent: ") (re.+ (re.range " " "~")) (str.to_re "\u{d}\u{a}Host: ") (re.+ (re.union (re.range "a" "z") (re.range "0" "9") (str.to_re "-") (str.to_re "."))) (str.to_re ".info\u{d}\u{a}/\u{a}")))))
(check-sat)
