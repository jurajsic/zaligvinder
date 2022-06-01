(declare-const X String)
; .*(\.[Jj][Pp][Gg]|\.[Gg][Ii][Ff]|\.[Jj][Pp][Ee][Gg]|\.[Pp][Nn][Gg])
(assert (str.in_re X (re.++ (re.* re.allchar) (str.to_re "\u{a}.") (re.union (re.++ (re.union (str.to_re "J") (str.to_re "j")) (re.union (str.to_re "P") (str.to_re "p")) (re.union (str.to_re "G") (str.to_re "g"))) (re.++ (re.union (str.to_re "G") (str.to_re "g")) (re.union (str.to_re "I") (str.to_re "i")) (re.union (str.to_re "F") (str.to_re "f"))) (re.++ (re.union (str.to_re "J") (str.to_re "j")) (re.union (str.to_re "P") (str.to_re "p")) (re.union (str.to_re "E") (str.to_re "e")) (re.union (str.to_re "G") (str.to_re "g"))) (re.++ (re.union (str.to_re "P") (str.to_re "p")) (re.union (str.to_re "N") (str.to_re "n")) (re.union (str.to_re "G") (str.to_re "g")))))))
; ^[13][a-zA-Z0-9]{26,33}$
(assert (not (str.in_re X (re.++ (re.union (str.to_re "1") (str.to_re "3")) ((_ re.loop 26 33) (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9"))) (str.to_re "\u{a}")))))
; Host\u{3A}\s+Online100013Agentsvr\u{5E}\u{5E}Merlin
(assert (not (str.in_re X (re.++ (str.to_re "Host:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Online100013Agentsvr^^Merlin\u{13}\u{a}")))))
; NetTracker\.htaServerTheef2trustyfiles\u{2E}comlogsHost\u{3A}version
(assert (str.in_re X (str.to_re "NetTracker.htaServerTheef2trustyfiles.comlogsHost:version\u{a}")))
(check-sat)
