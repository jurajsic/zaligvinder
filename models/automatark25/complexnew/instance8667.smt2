(declare-const X String)
; \u{5B}Static\w+www\.iggsey\.comUser-Agent\u{3A}X-Mailer\u{3a}Computer
(assert (not (str.in_re X (re.++ (str.to_re "[Static") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "www.iggsey.comUser-Agent:X-Mailer:\u{13}Computer\u{a}")))))
; ^(\+65)?\d{8}$
(assert (not (str.in_re X (re.++ (re.opt (str.to_re "+65")) ((_ re.loop 8 8) (re.range "0" "9")) (str.to_re "\u{a}")))))
; that.*CodeguruBrowser.*CasinoBladeisInsideupdate\.cgiHost\u{3A}
(assert (str.in_re X (re.++ (str.to_re "that") (re.* re.allchar) (str.to_re "CodeguruBrowser") (re.* re.allchar) (str.to_re "CasinoBladeisInsideupdate.cgiHost:\u{a}"))))
; ^\b\d{2,3}-*\d{7}\b$
(assert (str.in_re X (re.++ ((_ re.loop 2 3) (re.range "0" "9")) (re.* (str.to_re "-")) ((_ re.loop 7 7) (re.range "0" "9")) (str.to_re "\u{a}"))))
; /filename=[^\n]*\u{2e}xls/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".xls/i\u{a}"))))
(check-sat)
