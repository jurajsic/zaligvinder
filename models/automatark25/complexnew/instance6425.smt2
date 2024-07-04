(set-logic QF_SLIA)
(declare-const X String)
; (\_\_)(.+)(\_\_)
(assert (not (str.in_re X (re.++ (str.to_re "__") (re.+ re.allchar) (str.to_re "__\u{a}")))))
; Spyware\s+ToolBar\s+User-Agent\u{3A}MM_RECO\u{2E}EXEToClientonAlert
(assert (not (str.in_re X (re.++ (str.to_re "Spyware") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "ToolBar") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "User-Agent:MM_RECO.EXEToClientonAlert\u{a}")))))
; /^\/cnt\.php\?id=\d+$/U
(assert (not (str.in_re X (re.++ (str.to_re "//cnt.php?id=") (re.+ (re.range "0" "9")) (str.to_re "/U\u{a}")))))
; track\s+community\d+4\u{2e}8\u{2e}4www\u{2E}maxifiles\u{2E}com
(assert (str.in_re X (re.++ (str.to_re "track") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "community") (re.+ (re.range "0" "9")) (str.to_re "4.8.4www.maxifiles.com\u{a}"))))
; ^(0?\d|1[012])\/([012]?\d|3[01])\/(\d{2}|\d{4})$
(assert (str.in_re X (re.++ (re.union (re.++ (re.opt (str.to_re "0")) (re.range "0" "9")) (re.++ (str.to_re "1") (re.union (str.to_re "0") (str.to_re "1") (str.to_re "2")))) (str.to_re "/") (re.union (re.++ (re.opt (re.union (str.to_re "0") (str.to_re "1") (str.to_re "2"))) (re.range "0" "9")) (re.++ (str.to_re "3") (re.union (str.to_re "0") (str.to_re "1")))) (str.to_re "/") (re.union ((_ re.loop 2 2) (re.range "0" "9")) ((_ re.loop 4 4) (re.range "0" "9"))) (str.to_re "\u{a}"))))
(check-sat)
