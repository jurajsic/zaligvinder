(set-logic QF_SLIA)
(declare-const X String)
; ^((Sir|Dr.|Mr.|Mrs.|Ms.|Rev.){1}[ ]?)?([A-Z]{1}[.]{1}([A-Z]{1}[.]{1})?|[A-Z]{1}[a-z]{1,}|[A-Z]{1}[a-z]{1,}[-]{1}[A-Z]{1}[a-z]{1,}|[A-Z]{1}[a-z]{0,}[ ]{1}[A-Z]{1}[a-z]{0,}){1}$
(assert (str.in_re X (re.++ (re.opt (re.++ ((_ re.loop 1 1) (re.union (str.to_re "Sir") (re.++ (str.to_re "Dr") re.allchar) (re.++ (str.to_re "Mr") re.allchar) (re.++ (str.to_re "Mrs") re.allchar) (re.++ (str.to_re "Ms") re.allchar) (re.++ (str.to_re "Rev") re.allchar))) (re.opt (str.to_re " ")))) ((_ re.loop 1 1) (re.union (re.++ ((_ re.loop 1 1) (re.range "A" "Z")) ((_ re.loop 1 1) (str.to_re ".")) (re.opt (re.++ ((_ re.loop 1 1) (re.range "A" "Z")) ((_ re.loop 1 1) (str.to_re "."))))) (re.++ ((_ re.loop 1 1) (re.range "A" "Z")) (re.+ (re.range "a" "z"))) (re.++ ((_ re.loop 1 1) (re.range "A" "Z")) (re.+ (re.range "a" "z")) ((_ re.loop 1 1) (str.to_re "-")) ((_ re.loop 1 1) (re.range "A" "Z")) (re.+ (re.range "a" "z"))) (re.++ ((_ re.loop 1 1) (re.range "A" "Z")) (re.* (re.range "a" "z")) ((_ re.loop 1 1) (str.to_re " ")) ((_ re.loop 1 1) (re.range "A" "Z")) (re.* (re.range "a" "z"))))) (str.to_re "\u{a}"))))
; as\u{2E}starware\u{2E}com\u{2F}dp\u{2F}search\?x=.*X-Mailer\u{3A}
(assert (str.in_re X (re.++ (str.to_re "as.starware.com/dp/search?x=") (re.* re.allchar) (str.to_re "X-Mailer:\u{13}\u{a}"))))
(check-sat)
