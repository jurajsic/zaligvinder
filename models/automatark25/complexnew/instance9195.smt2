(declare-const X String)
; Host\u{3A}\u{25}2EResultsUser-Agent\u{3A}
(assert (not (str.in_re X (str.to_re "Host:%2EResultsUser-Agent:\u{a}"))))
; [A-Za-z]{2}[0-9]{1,6}|[0-9]{1,8}
(assert (str.in_re X (re.union (re.++ ((_ re.loop 2 2) (re.union (re.range "A" "Z") (re.range "a" "z"))) ((_ re.loop 1 6) (re.range "0" "9"))) (re.++ ((_ re.loop 1 8) (re.range "0" "9")) (str.to_re "\u{a}")))))
; gpstool\u{2e}globaladserver\u{2e}comfriend_nickname=CIA-Notify-Tezt
(assert (str.in_re X (str.to_re "gpstool.globaladserver.comfriend_nickname=CIA-Notify-Tezt\u{a}")))
; ^[1-9]{1}[0-9]{3}-(0[1-9]{1}|1[0-2]{1})-([0-2]{1}[1-9]{1}|3[0-1]{1}) ([0-1]{1}[0-9]{1}|2[0-3]{1}):[0-5]{1}[0-9]{1}:[0-5]{1}[0-9]{1}$
(assert (not (str.in_re X (re.++ ((_ re.loop 1 1) (re.range "1" "9")) ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "-") (re.union (re.++ (str.to_re "0") ((_ re.loop 1 1) (re.range "1" "9"))) (re.++ (str.to_re "1") ((_ re.loop 1 1) (re.range "0" "2")))) (str.to_re "-") (re.union (re.++ ((_ re.loop 1 1) (re.range "0" "2")) ((_ re.loop 1 1) (re.range "1" "9"))) (re.++ (str.to_re "3") ((_ re.loop 1 1) (re.range "0" "1")))) (str.to_re " ") (re.union (re.++ ((_ re.loop 1 1) (re.range "0" "1")) ((_ re.loop 1 1) (re.range "0" "9"))) (re.++ (str.to_re "2") ((_ re.loop 1 1) (re.range "0" "3")))) (str.to_re ":") ((_ re.loop 1 1) (re.range "0" "5")) ((_ re.loop 1 1) (re.range "0" "9")) (str.to_re ":") ((_ re.loop 1 1) (re.range "0" "5")) ((_ re.loop 1 1) (re.range "0" "9")) (str.to_re "\u{a}")))))
; /filename=[^\n]*\u{2e}asf/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".asf/i\u{a}"))))
(check-sat)
