(set-logic QF_SLIA)
(declare-const X String)
; \d{3}-\d{6}
(assert (str.in_re X (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 6 6) (re.range "0" "9")) (str.to_re "\u{a}"))))
; ^((\+[1-9]{1}[0-9]{0,3})?\s?(\([1-9]{1}[0-9]{0,3}\)))?\s?(\b\d{1,9}\b)$
(assert (str.in_re X (re.++ (re.opt (re.++ (re.opt (re.++ (str.to_re "+") ((_ re.loop 1 1) (re.range "1" "9")) ((_ re.loop 0 3) (re.range "0" "9")))) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "(") ((_ re.loop 1 1) (re.range "1" "9")) ((_ re.loop 0 3) (re.range "0" "9")) (str.to_re ")"))) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 1 9) (re.range "0" "9")) (str.to_re "\u{a}"))))
; client\u{2E}baigoo\u{2E}com\s+ised2k
(assert (str.in_re X (re.++ (str.to_re "client.baigoo.com") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "ised2k\u{a}"))))
; findX-Mailer\u{3a}User-Agent\u{3A}www\.take5bingo\.comX-Mailer\u{3a}\u{4}\u{0}
(assert (str.in_re X (str.to_re "findX-Mailer:\u{13}User-Agent:www.take5bingo.com\u{1b}X-Mailer:\u{13}\u{4}\u{0}\u{a}")))
(check-sat)
