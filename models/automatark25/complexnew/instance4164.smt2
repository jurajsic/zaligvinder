(declare-const X String)
; $sPatternTablet = '/(Tablet|iPad|iPod)/';
(assert (str.in_re X (re.++ (str.to_re "sPatternTablet = '/") (re.union (str.to_re "Tablet") (str.to_re "iPad") (str.to_re "iPod")) (str.to_re "/';\u{a}"))))
; thesearchresltLoggerHost\u{3A}BetaHWAEHost\u{3A}is
(assert (not (str.in_re X (str.to_re "thesearchresltLoggerHost:BetaHWAEHost:is\u{a}"))))
; /domain=[^&]*?([\u{3b}\u{60}]|\u{24}\u{28}|%3b|%60|%24%28)/Pi
(assert (str.in_re X (re.++ (str.to_re "/domain=") (re.* (re.comp (str.to_re "&"))) (re.union (str.to_re "$(") (str.to_re "%3b") (str.to_re "%60") (str.to_re "%24%28") (str.to_re ";") (str.to_re "`")) (str.to_re "/Pi\u{a}"))))
; /^\/([a-zA-Z0-9-&+ ]+[^\/?]=){5}/Ui
(assert (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 5 5) (re.++ (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "-") (str.to_re "&") (str.to_re "+") (str.to_re " "))) (re.union (str.to_re "/") (str.to_re "?")) (str.to_re "="))) (str.to_re "/Ui\u{a}"))))
(check-sat)
