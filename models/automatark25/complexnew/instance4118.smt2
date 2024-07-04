(set-logic QF_SLIA)
(declare-const X String)
; Host\u{3A}From\u{3a}Keylogger
(assert (str.in_re X (str.to_re "Host:From:Keylogger\u{a}")))
; www\u{2E}sogou\u{2E}comix=WebsiteHost\u{3a}Web-Mail
(assert (str.in_re X (str.to_re "www.sogou.comix=WebsiteHost:Web-Mail\u{a}")))
(check-sat)
