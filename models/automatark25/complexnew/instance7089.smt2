(declare-const X String)
; ^[a-zA-Z]{3}[uU]{1}[0-9]{7}$
(assert (str.in_re X (re.++ ((_ re.loop 3 3) (re.union (re.range "a" "z") (re.range "A" "Z"))) ((_ re.loop 1 1) (re.union (str.to_re "u") (str.to_re "U"))) ((_ re.loop 7 7) (re.range "0" "9")) (str.to_re "\u{a}"))))
; ^[a-zA-Z]{1,3}\[([0-9]{1,3})\]
(assert (not (str.in_re X (re.++ ((_ re.loop 1 3) (re.union (re.range "a" "z") (re.range "A" "Z"))) (str.to_re "[") ((_ re.loop 1 3) (re.range "0" "9")) (str.to_re "]\u{a}")))))
; /ID3\u{3}\u{0}.{5}([TW][A-Z]{3}|COMM)/smi
(assert (not (str.in_re X (re.++ (str.to_re "/ID3\u{3}\u{0}") ((_ re.loop 5 5) re.allchar) (re.union (re.++ (re.union (str.to_re "T") (str.to_re "W")) ((_ re.loop 3 3) (re.range "A" "Z"))) (str.to_re "COMM")) (str.to_re "/smi\u{a}")))))
; Hours\w+User-Agent\u{3A}ChildWebGuardian
(assert (not (str.in_re X (re.++ (str.to_re "Hours") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "User-Agent:ChildWebGuardian\u{a}")))))
; /\/home\/index.asp\?typeid\=[0-9]{1,3}/Ui
(assert (not (str.in_re X (re.++ (str.to_re "//home/index") re.allchar (str.to_re "asp?typeid=") ((_ re.loop 1 3) (re.range "0" "9")) (str.to_re "/Ui\u{a}")))))
(check-sat)
