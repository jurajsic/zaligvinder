(declare-const X String)
; ^(19|20)[0-9]{2}-((01|03|05|07|08|10|12)-(0[1-9]|[12][0-9]|3[01]))|(02-(0[1-9]|[12][0-9]))|((04|06|09|11)-(0[1-9]|[12][0-9]|30))$
(assert (not (str.in_re X (re.union (re.++ (re.union (str.to_re "19") (str.to_re "20")) ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "-") (re.union (str.to_re "01") (str.to_re "03") (str.to_re "05") (str.to_re "07") (str.to_re "08") (str.to_re "10") (str.to_re "12")) (str.to_re "-") (re.union (re.++ (str.to_re "0") (re.range "1" "9")) (re.++ (re.union (str.to_re "1") (str.to_re "2")) (re.range "0" "9")) (re.++ (str.to_re "3") (re.union (str.to_re "0") (str.to_re "1"))))) (re.++ (str.to_re "02-") (re.union (re.++ (str.to_re "0") (re.range "1" "9")) (re.++ (re.union (str.to_re "1") (str.to_re "2")) (re.range "0" "9")))) (re.++ (str.to_re "\u{a}") (re.union (str.to_re "04") (str.to_re "06") (str.to_re "09") (str.to_re "11")) (str.to_re "-") (re.union (re.++ (str.to_re "0") (re.range "1" "9")) (re.++ (re.union (str.to_re "1") (str.to_re "2")) (re.range "0" "9")) (str.to_re "30")))))))
; /filename=[^\n]*\u{2e}svg/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".svg/i\u{a}")))))
; ^([9]{1})+(6|3|2|1{1})+([0-9]{7})$
(assert (not (str.in_re X (re.++ (re.+ ((_ re.loop 1 1) (str.to_re "9"))) (re.+ (re.union (str.to_re "6") (str.to_re "3") (str.to_re "2") ((_ re.loop 1 1) (str.to_re "1")))) ((_ re.loop 7 7) (re.range "0" "9")) (str.to_re "\u{a}")))))
; iz=cyber@yahoo\u{2E}comSpyBuddyCenterIP-WindowsAttachedPalas\u{2E}starware\u{2E}com\u{2F}dp\u{2F}search\?x=
(assert (not (str.in_re X (str.to_re "iz=cyber@yahoo.comSpyBuddyCenterIP-WindowsAttachedPalas.starware.com/dp/search?x=\u{a}"))))
(check-sat)
