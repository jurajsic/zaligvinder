(set-logic QF_SLIA)
(declare-const X String)
; ^\[assembly: AssemblyVersion\(\"([0-9]+)\.([0-9]+)\.([0-9]+)\.([0-9]+)
(assert (str.in_re X (re.++ (str.to_re "[assembly: AssemblyVersion(\u{22}") (re.+ (re.range "0" "9")) (str.to_re ".") (re.+ (re.range "0" "9")) (str.to_re ".") (re.+ (re.range "0" "9")) (str.to_re ".") (re.+ (re.range "0" "9")) (str.to_re "\u{a}"))))
; ^\d?\d'(\d|1[01])?.?(\d|1[01])"$
(assert (str.in_re X (re.++ (re.opt (re.range "0" "9")) (re.range "0" "9") (str.to_re "'") (re.opt (re.union (re.range "0" "9") (re.++ (str.to_re "1") (re.union (str.to_re "0") (str.to_re "1"))))) (re.opt re.allchar) (re.union (re.range "0" "9") (re.++ (str.to_re "1") (re.union (str.to_re "0") (str.to_re "1")))) (str.to_re "\u{22}\u{a}"))))
; ^[0-9]{1}$|^[1-6]{1}[0-3]{1}$|^64$|\-[1-9]{1}$|^\-[1-6]{1}[0-3]{1}$|^\-64$
(assert (not (str.in_re X (re.union ((_ re.loop 1 1) (re.range "0" "9")) (re.++ ((_ re.loop 1 1) (re.range "1" "6")) ((_ re.loop 1 1) (re.range "0" "3"))) (str.to_re "64") (re.++ (str.to_re "-") ((_ re.loop 1 1) (re.range "1" "9"))) (re.++ (str.to_re "-") ((_ re.loop 1 1) (re.range "1" "6")) ((_ re.loop 1 1) (re.range "0" "3"))) (str.to_re "-64\u{a}")))))
; are\s+Toolbar\s+X-Mailer\u{3A}Informationsearchnuggetspastb\u{2E}freeprod\u{2E}com
(assert (str.in_re X (re.++ (str.to_re "are") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Toolbar") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "X-Mailer:\u{13}Informationsearchnugget\u{13}spastb.freeprod.com\u{a}"))))
; from\s+\u{2F}dss\u{2F}cc\.2_0_0\.[^\n\r]*uploadServer
(assert (str.in_re X (re.++ (str.to_re "from") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "/dss/cc.2_0_0.") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "uploadServer\u{a}"))))
(check-sat)
