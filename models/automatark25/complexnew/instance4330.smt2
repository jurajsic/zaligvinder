(set-logic QF_SLIA)
(declare-const X String)
; ^\$[0-9]+(\.[0-9][0-9])?$
(assert (not (str.in_re X (re.++ (str.to_re "$") (re.+ (re.range "0" "9")) (re.opt (re.++ (str.to_re ".") (re.range "0" "9") (re.range "0" "9"))) (str.to_re "\u{a}")))))
; /filename=[^\n]*\u{2e}torrent/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".torrent/i\u{a}")))))
; 62[0-9]{14,17}
(assert (str.in_re X (re.++ (str.to_re "62") ((_ re.loop 14 17) (re.range "0" "9")) (str.to_re "\u{a}"))))
; /filename=[^\n]*\u{2e}f4b/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".f4b/i\u{a}"))))
(check-sat)
