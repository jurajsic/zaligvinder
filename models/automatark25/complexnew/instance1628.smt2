(declare-const X String)
; (^[0-9]{1,8}|(^[0-9]{1,8}\.{0,1}[0-9]{1,2}))$
(assert (not (str.in_re X (re.++ (re.union ((_ re.loop 1 8) (re.range "0" "9")) (re.++ ((_ re.loop 1 8) (re.range "0" "9")) (re.opt (str.to_re ".")) ((_ re.loop 1 2) (re.range "0" "9")))) (str.to_re "\u{a}")))))
; horoscope2YAHOOwww\u{2e}2-seek\u{2e}com\u{2f}searchHost\u{3A}
(assert (not (str.in_re X (str.to_re "horoscope2YAHOOwww.2-seek.com/searchHost:\u{a}"))))
; /^\/load\.php\?spl=[^&]+&b=[^&]+&o=[^&]+&i=/U
(assert (not (str.in_re X (re.++ (str.to_re "//load.php?spl=") (re.+ (re.comp (str.to_re "&"))) (str.to_re "&b=") (re.+ (re.comp (str.to_re "&"))) (str.to_re "&o=") (re.+ (re.comp (str.to_re "&"))) (str.to_re "&i=/U\u{a}")))))
(check-sat)
