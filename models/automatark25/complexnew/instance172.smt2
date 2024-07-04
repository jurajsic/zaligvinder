(set-logic QF_SLIA)
(declare-const X String)
; ShadowNet\dsearchresltAID\u{2F}User-Agent\u{3A}Fen\u{ea}treEye\u{2F}dss\u{2F}cc\.2_0_0\.
(assert (not (str.in_re X (re.++ (str.to_re "ShadowNet") (re.range "0" "9") (str.to_re "searchresltAID/User-Agent:Fen\u{ea}treEye/dss/cc.2_0_0.\u{a}")))))
; /nsrmm[^\u{0}]*?([\u{3b}\u{7c}\u{26}\u{60}]|\u{24}\u{28})/
(assert (not (str.in_re X (re.++ (str.to_re "/nsrmm") (re.* (re.comp (str.to_re "\u{0}"))) (re.union (str.to_re "$(") (str.to_re ";") (str.to_re "|") (str.to_re "&") (str.to_re "`")) (str.to_re "/\u{a}")))))
; ^((\+\s?\d{2}|\(?00\s?\d{2}\)?)\s?\d{2}\s?\d{3}\s?\d{4})
(assert (str.in_re X (re.++ (str.to_re "\u{a}") (re.union (re.++ (str.to_re "+") (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 2 2) (re.range "0" "9"))) (re.++ (re.opt (str.to_re "(")) (str.to_re "00") (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 2 2) (re.range "0" "9")) (re.opt (str.to_re ")")))) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 2 2) (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 4 4) (re.range "0" "9")))))
; ^([1][12]|[0]?[1-9])[\/-]([3][01]|[12]\d|[0]?[1-9])[\/-](\d{4}|\d{2})$
(assert (str.in_re X (re.++ (re.union (re.++ (str.to_re "1") (re.union (str.to_re "1") (str.to_re "2"))) (re.++ (re.opt (str.to_re "0")) (re.range "1" "9"))) (re.union (str.to_re "/") (str.to_re "-")) (re.union (re.++ (str.to_re "3") (re.union (str.to_re "0") (str.to_re "1"))) (re.++ (re.union (str.to_re "1") (str.to_re "2")) (re.range "0" "9")) (re.++ (re.opt (str.to_re "0")) (re.range "1" "9"))) (re.union (str.to_re "/") (str.to_re "-")) (re.union ((_ re.loop 4 4) (re.range "0" "9")) ((_ re.loop 2 2) (re.range "0" "9"))) (str.to_re "\u{a}"))))
(check-sat)
