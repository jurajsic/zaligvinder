(set-logic QF_SLIA)
(declare-const X String)
; MyPostsearch\u{2e}conduit\u{2e}comUser-Agent\u{3A}AcmeSubject\u{3A}ready\.\r\n
(assert (str.in_re X (str.to_re "MyPostsearch.conduit.comUser-Agent:AcmeSubject:ready.\u{d}\u{a}\u{a}")))
; [0](\d{9})|([0](\d{2})( |-)((\d{3}))( |-)(\d{4}))|[0](\d{2})( |-)(\d{7})
(assert (str.in_re X (re.union (re.++ (str.to_re "0") ((_ re.loop 9 9) (re.range "0" "9"))) (re.++ (str.to_re "0") ((_ re.loop 2 2) (re.range "0" "9")) (re.union (str.to_re " ") (str.to_re "-")) ((_ re.loop 3 3) (re.range "0" "9")) (re.union (str.to_re " ") (str.to_re "-")) ((_ re.loop 4 4) (re.range "0" "9"))) (re.++ (str.to_re "0") ((_ re.loop 2 2) (re.range "0" "9")) (re.union (str.to_re " ") (str.to_re "-")) ((_ re.loop 7 7) (re.range "0" "9")) (str.to_re "\u{a}")))))
; /^\u{2f}[a-z0-9]{51}$/Ui
(assert (not (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 51 51) (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re "/Ui\u{a}")))))
; /filename=[^\n]*\u{2e}qt/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".qt/i\u{a}")))))
; /^\/jmx.jar?r=\d+/Ui
(assert (str.in_re X (re.++ (str.to_re "//jmx") re.allchar (str.to_re "ja") (re.opt (str.to_re "r")) (str.to_re "r=") (re.+ (re.range "0" "9")) (str.to_re "/Ui\u{a}"))))
(check-sat)
