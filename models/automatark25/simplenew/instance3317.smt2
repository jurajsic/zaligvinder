(declare-const X String)
; ^[^#]([^ ]+ ){6}[^ ]+$
(assert (str.in_re X (re.++ (re.comp (str.to_re "#")) ((_ re.loop 6 6) (re.++ (re.+ (re.comp (str.to_re " "))) (str.to_re " "))) (re.+ (re.comp (str.to_re " "))) (str.to_re "\u{a}"))))
(check-sat)
