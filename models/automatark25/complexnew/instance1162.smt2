(set-logic QF_SLIA)
(declare-const X String)
; /\u{2e}jpf([\?\u{5c}\u{2f}]|$)/smiU
(assert (not (str.in_re X (re.++ (str.to_re "/.jpf") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}")))))
; ^(\$)?((\d{1,5})|(\d{1,3})(\,\d{3})*)(\.\d{1,2})?$
(assert (not (str.in_re X (re.++ (re.opt (str.to_re "$")) (re.union ((_ re.loop 1 5) (re.range "0" "9")) (re.++ ((_ re.loop 1 3) (re.range "0" "9")) (re.* (re.++ (str.to_re ",") ((_ re.loop 3 3) (re.range "0" "9")))))) (re.opt (re.++ (str.to_re ".") ((_ re.loop 1 2) (re.range "0" "9")))) (str.to_re "\u{a}")))))
; IndyHost\u{3A}GirlFriendReferer\u{3A}
(assert (str.in_re X (str.to_re "IndyHost:GirlFriendReferer:\u{a}")))
; /filename=[^\n]*\u{2e}ppt/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".ppt/i\u{a}"))))
; HXLogOnlyDaemonactivityIterenetFrom\u{3A}Class
(assert (not (str.in_re X (str.to_re "HXLogOnlyDaemonactivityIterenetFrom:Class\u{a}"))))
(check-sat)
