(set-logic QF_SLIA)
(declare-const X String)
; TPSystemHost\u{3A}Host\u{3a}show\u{2E}roogoo\u{2E}comX-Mailer\u{3A}
(assert (not (str.in_re X (str.to_re "TPSystemHost:Host:show.roogoo.comX-Mailer:\u{13}\u{a}"))))
; dat\s+resultsmaster\u{2E}com.*Host\u{3a}.*SpyAgentRootHost\u{3A}AdToolsSubject\u{3A}e2give\.com
(assert (str.in_re X (re.++ (str.to_re "dat") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "resultsmaster.com\u{13}") (re.* re.allchar) (str.to_re "Host:") (re.* re.allchar) (str.to_re "SpyAgentRootHost:AdToolsSubject:e2give.com\u{a}"))))
; ^(0[1-9]|1[012])[/](0[1-9]|[12][0-9]|3[01])[/][0-9]{4}(\s((0[1-9]|1[012])\:([0-5][0-9])((\s)|(\:([0-5][0-9])\s))([AM|PM|]{2,2})))?$
(assert (str.in_re X (re.++ (re.union (re.++ (str.to_re "0") (re.range "1" "9")) (re.++ (str.to_re "1") (re.union (str.to_re "0") (str.to_re "1") (str.to_re "2")))) (str.to_re "/") (re.union (re.++ (str.to_re "0") (re.range "1" "9")) (re.++ (re.union (str.to_re "1") (str.to_re "2")) (re.range "0" "9")) (re.++ (str.to_re "3") (re.union (str.to_re "0") (str.to_re "1")))) (str.to_re "/") ((_ re.loop 4 4) (re.range "0" "9")) (re.opt (re.++ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (re.union (re.++ (str.to_re "0") (re.range "1" "9")) (re.++ (str.to_re "1") (re.union (str.to_re "0") (str.to_re "1") (str.to_re "2")))) (str.to_re ":") (re.union (re.++ (str.to_re ":") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (re.range "0" "5") (re.range "0" "9")) (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) ((_ re.loop 2 2) (re.union (str.to_re "A") (str.to_re "M") (str.to_re "|") (str.to_re "P"))) (re.range "0" "5") (re.range "0" "9"))) (str.to_re "\u{a}"))))
; [A-Za-z_.0-9-]+@{1}[a-z]+([.]{1}[a-z]{2,4})+
(assert (str.in_re X (re.++ (re.+ (re.union (re.range "A" "Z") (re.range "a" "z") (str.to_re "_") (str.to_re ".") (re.range "0" "9") (str.to_re "-"))) ((_ re.loop 1 1) (str.to_re "@")) (re.+ (re.range "a" "z")) (re.+ (re.++ ((_ re.loop 1 1) (str.to_re ".")) ((_ re.loop 2 4) (re.range "a" "z")))) (str.to_re "\u{a}"))))
; e2give\.com.*Host\u{3A}.*Host\u{3a}
(assert (not (str.in_re X (re.++ (str.to_re "e2give.com") (re.* re.allchar) (str.to_re "Host:") (re.* re.allchar) (str.to_re "Host:\u{a}")))))
(check-sat)
