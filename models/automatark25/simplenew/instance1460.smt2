(declare-const X String)
; /\/pte\.aspx\?ver=\d\.\d\.\d+\.\d\u{26}rnd=\d{5}/Ui
(assert (str.in_re X (re.++ (str.to_re "//pte.aspx?ver=") (re.range "0" "9") (str.to_re ".") (re.range "0" "9") (str.to_re ".") (re.+ (re.range "0" "9")) (str.to_re ".") (re.range "0" "9") (str.to_re "&rnd=") ((_ re.loop 5 5) (re.range "0" "9")) (str.to_re "/Ui\u{a}"))))
(check-sat)
