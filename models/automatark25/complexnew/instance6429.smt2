(declare-const X String)
; ('{2})*([^'\r\n]*)('{2})*([^'\r\n]*)('{2})*
(assert (not (str.in_re X (re.++ (re.* ((_ re.loop 2 2) (str.to_re "'"))) (re.* (re.union (str.to_re "'") (str.to_re "\u{d}") (str.to_re "\u{a}"))) (re.* ((_ re.loop 2 2) (str.to_re "'"))) (re.* (re.union (str.to_re "'") (str.to_re "\u{d}") (str.to_re "\u{a}"))) (re.* ((_ re.loop 2 2) (str.to_re "'"))) (str.to_re "\u{a}")))))
; Host\u{3A}Host\u{3A}LOGServer\.compressxpsp2-toolbar\u{2E}hotblox\u{2E}comAttached100013Agentsvr\u{5E}\u{5E}Merlin
(assert (not (str.in_re X (str.to_re "Host:Host:LOGServer.compressxpsp2-toolbar.hotblox.comAttached100013Agentsvr^^Merlin\u{13}\u{a}"))))
; ^[-]?\d{1,10}\.?([0-9][0-9])?$
(assert (not (str.in_re X (re.++ (re.opt (str.to_re "-")) ((_ re.loop 1 10) (re.range "0" "9")) (re.opt (str.to_re ".")) (re.opt (re.++ (re.range "0" "9") (re.range "0" "9"))) (str.to_re "\u{a}")))))
(check-sat)
