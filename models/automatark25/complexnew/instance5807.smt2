(declare-const X String)
; /\u{2e}pcx([\u{3f}\u{2f}]|$)/Uim
(assert (not (str.in_re X (re.++ (str.to_re "/.pcx") (re.union (str.to_re "?") (str.to_re "/")) (str.to_re "/Uim\u{a}")))))
; ^(0|(\+)?([1-9]{1}[0-9]{0,3})|([1-5]{1}[0-9]{1,4}|[6]{1}([0-4]{1}[0-9]{3}|[5]{1}([0-4]{1}[0-9]{2}|[5]{1}([0-2]{1}[0-9]{1}|[3]{1}[0-5]{1})))))$
(assert (not (str.in_re X (re.++ (re.union (str.to_re "0") (re.++ (re.opt (str.to_re "+")) ((_ re.loop 1 1) (re.range "1" "9")) ((_ re.loop 0 3) (re.range "0" "9"))) (re.++ ((_ re.loop 1 1) (re.range "1" "5")) ((_ re.loop 1 4) (re.range "0" "9"))) (re.++ ((_ re.loop 1 1) (str.to_re "6")) (re.union (re.++ ((_ re.loop 1 1) (re.range "0" "4")) ((_ re.loop 3 3) (re.range "0" "9"))) (re.++ ((_ re.loop 1 1) (str.to_re "5")) (re.union (re.++ ((_ re.loop 1 1) (re.range "0" "4")) ((_ re.loop 2 2) (re.range "0" "9"))) (re.++ ((_ re.loop 1 1) (str.to_re "5")) (re.union (re.++ ((_ re.loop 1 1) (re.range "0" "2")) ((_ re.loop 1 1) (re.range "0" "9"))) (re.++ ((_ re.loop 1 1) (str.to_re "3")) ((_ re.loop 1 1) (re.range "0" "5")))))))))) (str.to_re "\u{a}")))))
; www\u{2E}eblocs\u{2E}comcorep\u{2E}dmcast\u{2E}com
(assert (str.in_re X (str.to_re "www.eblocs.com\u{1b}corep.dmcast.com\u{a}")))
(check-sat)
