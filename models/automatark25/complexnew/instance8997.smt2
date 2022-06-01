(declare-const X String)
; findX-Mailer\u{3a}User-Agent\u{3A}www\.take5bingo\.comX-Mailer\u{3a}\u{4}\u{0}
(assert (not (str.in_re X (str.to_re "findX-Mailer:\u{13}User-Agent:www.take5bingo.com\u{1b}X-Mailer:\u{13}\u{4}\u{0}\u{a}"))))
; /\u{2F}aws\d{1,5}\.jsp\u{3F}/i
(assert (str.in_re X (re.++ (str.to_re "//aws") ((_ re.loop 1 5) (re.range "0" "9")) (str.to_re ".jsp?/i\u{a}"))))
; ([1-9]|[1-4][0-9]|5[0-2])
(assert (str.in_re X (re.++ (re.union (re.range "1" "9") (re.++ (re.range "1" "4") (re.range "0" "9")) (re.++ (str.to_re "5") (re.range "0" "2"))) (str.to_re "\u{a}"))))
; /User-Agent\u{3a}\sMSIE.*\u{3b}\sNT.*\u{3b}\sAV.*\u{3b}\sOV.*\u{3b}\sNA.*VR\u{28}PH5.0\sW20130912/H
(assert (not (str.in_re X (re.++ (str.to_re "/User-Agent:") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "MSIE") (re.* re.allchar) (str.to_re ";") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "NT") (re.* re.allchar) (str.to_re ";") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "AV") (re.* re.allchar) (str.to_re ";") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "OV") (re.* re.allchar) (str.to_re ";") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "NA") (re.* re.allchar) (str.to_re "VR(PH5") re.allchar (str.to_re "0") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "W20130912/H\u{a}")))))
; ^~/[0-9a-zA-Z_][0-9a-zA-Z/_-]*\.[0-9a-zA-Z_-]+$
(assert (str.in_re X (re.++ (str.to_re "~/") (re.union (re.range "0" "9") (re.range "a" "z") (re.range "A" "Z") (str.to_re "_")) (re.* (re.union (re.range "0" "9") (re.range "a" "z") (re.range "A" "Z") (str.to_re "/") (str.to_re "_") (str.to_re "-"))) (str.to_re ".") (re.+ (re.union (re.range "0" "9") (re.range "a" "z") (re.range "A" "Z") (str.to_re "_") (str.to_re "-"))) (str.to_re "\u{a}"))))
(check-sat)
