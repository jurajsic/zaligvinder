(set-logic QF_SLIA)
(declare-const X String)
; /filename=[^\n]*\u{2e}xspf/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".xspf/i\u{a}")))))
; ^(0|(\+)?[1-9]{1}[0-9]{0,8}|(\+)?[1-3]{1}[0-9]{1,9}|(\+)?[4]{1}([0-1]{1}[0-9]{8}|[2]{1}([0-8]{1}[0-9]{7}|[9]{1}([0-3]{1}[0-9]{6}|[4]{1}([0-8]{1}[0-9]{5}|[9]{1}([0-5]{1}[0-9]{4}|[6]{1}([0-6]{1}[0-9]{3}|[7]{1}([0-1]{1}[0-9]{2}|[2]{1}([0-8]{1}[0-9]{1}|[9]{1}[0-5]{1})))))))))$
(assert (str.in_re X (re.++ (re.union (str.to_re "0") (re.++ (re.opt (str.to_re "+")) ((_ re.loop 1 1) (re.range "1" "9")) ((_ re.loop 0 8) (re.range "0" "9"))) (re.++ (re.opt (str.to_re "+")) ((_ re.loop 1 1) (re.range "1" "3")) ((_ re.loop 1 9) (re.range "0" "9"))) (re.++ (re.opt (str.to_re "+")) ((_ re.loop 1 1) (str.to_re "4")) (re.union (re.++ ((_ re.loop 1 1) (re.range "0" "1")) ((_ re.loop 8 8) (re.range "0" "9"))) (re.++ ((_ re.loop 1 1) (str.to_re "2")) (re.union (re.++ ((_ re.loop 1 1) (re.range "0" "8")) ((_ re.loop 7 7) (re.range "0" "9"))) (re.++ ((_ re.loop 1 1) (str.to_re "9")) (re.union (re.++ ((_ re.loop 1 1) (re.range "0" "3")) ((_ re.loop 6 6) (re.range "0" "9"))) (re.++ ((_ re.loop 1 1) (str.to_re "4")) (re.union (re.++ ((_ re.loop 1 1) (re.range "0" "8")) ((_ re.loop 5 5) (re.range "0" "9"))) (re.++ ((_ re.loop 1 1) (str.to_re "9")) (re.union (re.++ ((_ re.loop 1 1) (re.range "0" "5")) ((_ re.loop 4 4) (re.range "0" "9"))) (re.++ ((_ re.loop 1 1) (str.to_re "6")) (re.union (re.++ ((_ re.loop 1 1) (re.range "0" "6")) ((_ re.loop 3 3) (re.range "0" "9"))) (re.++ ((_ re.loop 1 1) (str.to_re "7")) (re.union (re.++ ((_ re.loop 1 1) (re.range "0" "1")) ((_ re.loop 2 2) (re.range "0" "9"))) (re.++ ((_ re.loop 1 1) (str.to_re "2")) (re.union (re.++ ((_ re.loop 1 1) (re.range "0" "8")) ((_ re.loop 1 1) (re.range "0" "9"))) (re.++ ((_ re.loop 1 1) (str.to_re "9")) ((_ re.loop 1 1) (re.range "0" "5")))))))))))))))))))) (str.to_re "\u{a}"))))
; (\n\r)   replacement string---->\n
(assert (not (str.in_re X (str.to_re "\u{a}\u{d}   replacement string---->\u{a}\u{a}"))))
; /filename=[^\n]*\u{2e}mid/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".mid/i\u{a}"))))
; EFError.*\u{2F}cs\u{2F}pop4\u{2F}\s+
(assert (not (str.in_re X (re.++ (str.to_re "EFError") (re.* re.allchar) (str.to_re "/cs/pop4/") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "\u{a}")))))
(check-sat)
