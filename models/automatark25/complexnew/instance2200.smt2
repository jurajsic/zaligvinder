(set-logic QF_SLIA)
(declare-const X String)
; /(^|&)(db(username|password|)|cp(username|password|domain))=[^&]*?(\u{27}|%27)[^&]*?([\u{3b}\u{60}]|\u{24}\u{28}|%3b|%60|%24%28)/Pmi
(assert (str.in_re X (re.++ (str.to_re "/&") (re.union (re.++ (str.to_re "db") (re.union (str.to_re "username") (str.to_re "password"))) (re.++ (str.to_re "cp") (re.union (str.to_re "username") (str.to_re "password") (str.to_re "domain")))) (str.to_re "=") (re.* (re.comp (str.to_re "&"))) (re.union (str.to_re "'") (str.to_re "%27")) (re.* (re.comp (str.to_re "&"))) (re.union (str.to_re "$(") (str.to_re "%3b") (str.to_re "%60") (str.to_re "%24%28") (str.to_re ";") (str.to_re "`")) (str.to_re "/Pmi\u{a}"))))
; Host\u{3A}Host\u{3A}User-Agent\u{3A}Serverad\u{2E}mokead\u{2E}com
(assert (not (str.in_re X (str.to_re "Host:Host:User-Agent:Serverad.mokead.com\u{a}"))))
(check-sat)
