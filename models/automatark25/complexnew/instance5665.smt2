(declare-const X String)
; Host\u{3A}Host\u{3A}X-Mailer\u{3a}
(assert (not (str.in_re X (str.to_re "Host:Host:X-Mailer:\u{13}\u{a}"))))
; Host\u{3A}HANDYwww\u{2E}purityscan\u{2E}com
(assert (str.in_re X (str.to_re "Host:HANDYwww.purityscan.com\u{a}")))
; /filename=[^\n]*\u{2e}cis/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".cis/i\u{a}")))))
; ^(((Ctrl\+Shift\+Alt\+|Ctrl\+Shift\+|Ctrl\+Alt\+|Shift\+Alt\+|Ctrl\+|Alt\+){1}(F1[0-2]|F[1-9]|[A-Za-z0-9\-\=\[\]\\\;\'\,\.\/]){1}){1}|(Shift\+)?(F1[0-2]|F[1-9]){1})$
(assert (not (str.in_re X (re.++ (re.union ((_ re.loop 1 1) (re.++ ((_ re.loop 1 1) (re.union (str.to_re "Ctrl+Shift+Alt+") (str.to_re "Ctrl+Shift+") (str.to_re "Ctrl+Alt+") (str.to_re "Shift+Alt+") (str.to_re "Ctrl+") (str.to_re "Alt+"))) ((_ re.loop 1 1) (re.union (re.++ (str.to_re "F1") (re.range "0" "2")) (re.++ (str.to_re "F") (re.range "1" "9")) (re.range "A" "Z") (re.range "a" "z") (re.range "0" "9") (str.to_re "-") (str.to_re "=") (str.to_re "[") (str.to_re "]") (str.to_re "\u{5c}") (str.to_re ";") (str.to_re "'") (str.to_re ",") (str.to_re ".") (str.to_re "/"))))) (re.++ (re.opt (str.to_re "Shift+")) ((_ re.loop 1 1) (re.++ (str.to_re "F") (re.union (re.++ (str.to_re "1") (re.range "0" "2")) (re.range "1" "9")))))) (str.to_re "\u{a}")))))
(check-sat)
