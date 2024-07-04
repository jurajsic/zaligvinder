(set-logic QF_SLIA)
(declare-const X String)
; are\d+X-Mailer\u{3a}+\d+v=User-Agent\u{3a}
(assert (str.in_re X (re.++ (str.to_re "are") (re.+ (re.range "0" "9")) (str.to_re "X-Mailer") (re.+ (str.to_re ":")) (re.+ (re.range "0" "9")) (str.to_re "v=User-Agent:\u{a}"))))
; ^((\+)?[1-9]{1,2})?([-\s\.])?((\(\d{1,4}\))|\d{1,4})(([-\s\.])?[0-9]{1,12}){1,2}$
(assert (not (str.in_re X (re.++ (re.opt (re.++ (re.opt (str.to_re "+")) ((_ re.loop 1 2) (re.range "1" "9")))) (re.opt (re.union (str.to_re "-") (str.to_re ".") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.union (re.++ (str.to_re "(") ((_ re.loop 1 4) (re.range "0" "9")) (str.to_re ")")) ((_ re.loop 1 4) (re.range "0" "9"))) ((_ re.loop 1 2) (re.++ (re.opt (re.union (str.to_re "-") (str.to_re ".") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 1 12) (re.range "0" "9")))) (str.to_re "\u{a}")))))
; SpyBuddySubject\u{3A}stats\u{2e}drivecleaner\u{2e}com
(assert (not (str.in_re X (str.to_re "SpyBuddySubject:stats.drivecleaner.com\u{13}\u{a}"))))
(check-sat)
