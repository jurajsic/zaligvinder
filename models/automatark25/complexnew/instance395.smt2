(set-logic QF_SLIA)
(declare-const X String)
; ^(\d+|[a-zA-Z]+)$
(assert (str.in_re X (re.++ (re.union (re.+ (re.range "0" "9")) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z")))) (str.to_re "\u{a}"))))
; /filename=[^\n]*\u{2e}dws/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".dws/i\u{a}"))))
; ^([\w\-\.]+)@((\[([0-9]{1,3}\.){3}[0-9]{1,3}\])|(([\w\-]+\.)+)([a-zA-Z]{2,4}))$
(assert (not (str.in_re X (re.++ (re.+ (re.union (str.to_re "-") (str.to_re ".") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "@") (re.union (re.++ (str.to_re "[") ((_ re.loop 3 3) (re.++ ((_ re.loop 1 3) (re.range "0" "9")) (str.to_re "."))) ((_ re.loop 1 3) (re.range "0" "9")) (str.to_re "]")) (re.++ (re.+ (re.++ (re.+ (re.union (str.to_re "-") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "."))) ((_ re.loop 2 4) (re.union (re.range "a" "z") (re.range "A" "Z"))))) (str.to_re "\u{a}")))))
; /Accept\u{3a}\u{20}text\/\*\u{2c}\u{20}application\/\*\u{d}\u{a}User-Agent\u{3a}\u{20}[^\n]+\u{d}\u{a}Host\u{3a}[^\n]+\u{d}\u{a}(Pragma|Cache-Control)\u{3a}\u{20}no-cache\u{d}\u{a}(Connection\u{3a} Keep-Alive\u{d}\u{a})?(\u{d}\u{a})?$/
(assert (str.in_re X (re.++ (str.to_re "/Accept: text/*, application/*\u{d}\u{a}User-Agent: ") (re.+ (re.comp (str.to_re "\u{a}"))) (str.to_re "\u{d}\u{a}Host:") (re.+ (re.comp (str.to_re "\u{a}"))) (str.to_re "\u{d}\u{a}") (re.union (str.to_re "Pragma") (str.to_re "Cache-Control")) (str.to_re ": no-cache\u{d}\u{a}") (re.opt (str.to_re "Connection: Keep-Alive\u{d}\u{a}")) (re.opt (str.to_re "\u{d}\u{a}")) (str.to_re "/\u{a}"))))
; ^(958([0-9])+([0-9])+([0-9])+([0-9])+([0-9])+([0-9])+)|(958-([0-9])+([0-9])+([0-9])+([0-9])+([0-9])+([0-9])+)$
(assert (not (str.in_re X (re.union (re.++ (str.to_re "958") (re.+ (re.range "0" "9")) (re.+ (re.range "0" "9")) (re.+ (re.range "0" "9")) (re.+ (re.range "0" "9")) (re.+ (re.range "0" "9")) (re.+ (re.range "0" "9"))) (re.++ (str.to_re "\u{a}958-") (re.+ (re.range "0" "9")) (re.+ (re.range "0" "9")) (re.+ (re.range "0" "9")) (re.+ (re.range "0" "9")) (re.+ (re.range "0" "9")) (re.+ (re.range "0" "9")))))))
(check-sat)
