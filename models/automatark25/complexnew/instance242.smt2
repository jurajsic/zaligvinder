(set-logic QF_SLIA)
(declare-const X String)
; /filename=[^\n]*\u{2e}emf/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".emf/i\u{a}"))))
; /\/\?[a-z0-9]{9}\=[a-zA-Z0-9]{45}/U
(assert (str.in_re X (re.++ (str.to_re "//?") ((_ re.loop 9 9) (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re "=") ((_ re.loop 45 45) (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9"))) (str.to_re "/U\u{a}"))))
; ^\d{9}[\d|X]$
(assert (not (str.in_re X (re.++ ((_ re.loop 9 9) (re.range "0" "9")) (re.union (re.range "0" "9") (str.to_re "|") (str.to_re "X")) (str.to_re "\u{a}")))))
; /\/jovf\.html$/U
(assert (not (str.in_re X (str.to_re "//jovf.html/U\u{a}"))))
; /nsrmm[^\u{0}]*?([\u{3b}\u{7c}\u{26}\u{60}]|\u{24}\u{28})/
(assert (str.in_re X (re.++ (str.to_re "/nsrmm") (re.* (re.comp (str.to_re "\u{0}"))) (re.union (str.to_re "$(") (str.to_re ";") (str.to_re "|") (str.to_re "&") (str.to_re "`")) (str.to_re "/\u{a}"))))
(check-sat)
