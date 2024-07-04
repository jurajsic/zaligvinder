(set-logic QF_SLIA)
(declare-const X String)
; \u{2F}pagead\u{2F}ads\?waitingisDownload
(assert (str.in_re X (str.to_re "/pagead/ads?waitingisDownload\u{a}")))
; ^(20|23|27|30|33)-[0-9]{8}-[0-9]$
(assert (not (str.in_re X (re.++ (re.union (str.to_re "20") (str.to_re "23") (str.to_re "27") (str.to_re "30") (str.to_re "33")) (str.to_re "-") ((_ re.loop 8 8) (re.range "0" "9")) (str.to_re "-") (re.range "0" "9") (str.to_re "\u{a}")))))
(check-sat)
