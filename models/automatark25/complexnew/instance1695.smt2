(set-logic QF_SLIA)
(declare-const X String)
; ^(20|23|27|30|33)-[0-9]{8}-[0-9]$
(assert (str.in_re X (re.++ (re.union (str.to_re "20") (str.to_re "23") (str.to_re "27") (str.to_re "30") (str.to_re "33")) (str.to_re "-") ((_ re.loop 8 8) (re.range "0" "9")) (str.to_re "-") (re.range "0" "9") (str.to_re "\u{a}"))))
; /filename=[^\n]*\u{2e}xwd/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".xwd/i\u{a}")))))
; EFError\swww\u{2e}malware-stopper\u{2e}com
(assert (not (str.in_re X (re.++ (str.to_re "EFError") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "www.malware-stopper.com\u{a}")))))
; /filename=[^\n]*\u{2e}cpe/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".cpe/i\u{a}")))))
; User-Agent\u{3A}ChildWebGuardianHXDownloadX-Mailer\u{3a}
(assert (not (str.in_re X (str.to_re "User-Agent:ChildWebGuardianHXDownloadX-Mailer:\u{13}\u{a}"))))
(check-sat)
