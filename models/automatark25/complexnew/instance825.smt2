(set-logic QF_SLIA)
(declare-const X String)
; fsbuff\s+User-Agent\u{3A}from\u{3A}
(assert (not (str.in_re X (re.++ (str.to_re "fsbuff") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "User-Agent:from:\u{a}")))))
; ShadowNet\dsearchreslt\sTROJAN-Host\u{3A}YWRtaW46cGFzc3dvcmQ
(assert (str.in_re X (re.++ (str.to_re "ShadowNet") (re.range "0" "9") (str.to_re "searchreslt") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "TROJAN-Host:YWRtaW46cGFzc3dvcmQ\u{a}"))))
; kl\u{2E}search\u{2E}need2find\u{2E}com\ssource%3Dultrasearch136%26campaign%3Dsnap
(assert (str.in_re X (re.++ (str.to_re "kl.search.need2find.com") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "source%3Dultrasearch136%26campaign%3Dsnap\u{a}"))))
; ^[a-zA-Z]{1}[0-9]{1}[a-zA-Z]{1}[- ]{0,1}[0-9]{1}[a-zA-Z]{1}[0-9]{1}
(assert (not (str.in_re X (re.++ ((_ re.loop 1 1) (re.union (re.range "a" "z") (re.range "A" "Z"))) ((_ re.loop 1 1) (re.range "0" "9")) ((_ re.loop 1 1) (re.union (re.range "a" "z") (re.range "A" "Z"))) (re.opt (re.union (str.to_re "-") (str.to_re " "))) ((_ re.loop 1 1) (re.range "0" "9")) ((_ re.loop 1 1) (re.union (re.range "a" "z") (re.range "A" "Z"))) ((_ re.loop 1 1) (re.range "0" "9")) (str.to_re "\u{a}")))))
(check-sat)
