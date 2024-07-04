(set-logic QF_SLIA)
(declare-const X String)
; /^\/jmx.jar?r=\d+/Ui
(assert (not (str.in_re X (re.++ (str.to_re "//jmx") re.allchar (str.to_re "ja") (re.opt (str.to_re "r")) (str.to_re "r=") (re.+ (re.range "0" "9")) (str.to_re "/Ui\u{a}")))))
; /filename=[^\n]*\u{2e}metalink/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".metalink/i\u{a}"))))
(check-sat)
