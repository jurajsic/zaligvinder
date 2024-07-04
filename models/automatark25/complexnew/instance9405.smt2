(set-logic QF_SLIA)
(declare-const X String)
; /filename=[^\n]*\u{2e}mp3/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".mp3/i\u{a}")))))
; MailerHost\u{3A}User-Agent\u{3A}
(assert (not (str.in_re X (str.to_re "MailerHost:User-Agent:\u{a}"))))
(check-sat)
