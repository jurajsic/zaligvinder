(declare-const X String)
; IPOblivionhoroscopefowclxccdxn\u{2f}uxwn\.ddy
(assert (str.in_re X (str.to_re "IPOblivionhoroscopefowclxccdxn/uxwn.ddy\u{a}")))
; /^guid=[a-f0-9]{32}\u{26}state=(LOST|WORK|WAIT|RUN)/P
(assert (not (str.in_re X (re.++ (str.to_re "/guid=") ((_ re.loop 32 32) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "&state=") (re.union (str.to_re "LOST") (str.to_re "WORK") (str.to_re "WAIT") (str.to_re "RUN")) (str.to_re "/P\u{a}")))))
; search\u{2e}conduit\u{2e}com\d+sidebar\.activeshopper\.comUser-Agent\u{3A}
(assert (not (str.in_re X (re.++ (str.to_re "search.conduit.com") (re.+ (re.range "0" "9")) (str.to_re "sidebar.activeshopper.comUser-Agent:\u{a}")))))
(check-sat)
