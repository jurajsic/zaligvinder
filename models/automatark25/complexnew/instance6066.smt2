(declare-const X String)
; ^[A-Z]{1}-[0-9]{7}$
(assert (not (str.in_re X (re.++ ((_ re.loop 1 1) (re.range "A" "Z")) (str.to_re "-") ((_ re.loop 7 7) (re.range "0" "9")) (str.to_re "\u{a}")))))
; GmbH\u{2F}communicatortbHost\u{3A}User-Agent\u{3A}adblock\u{2E}linkz\u{2E}com
(assert (str.in_re X (str.to_re "GmbH/communicatortbHost:User-Agent:adblock.linkz.com\u{a}")))
; /(((ftp|http|https):\/\/)|(\w+:{0,1}\w*@))?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/
(assert (str.in_re X (re.++ (str.to_re "/") (re.opt (re.union (re.++ (re.union (str.to_re "ftp") (str.to_re "http") (str.to_re "https")) (str.to_re "://")) (re.++ (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (re.opt (str.to_re ":")) (re.* (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "@")))) (re.+ (re.comp (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")))) (re.opt (re.++ (str.to_re ":") (re.+ (re.range "0" "9")))) (re.opt (re.++ (str.to_re "/") (re.union (str.to_re "#") (str.to_re "!") (str.to_re ":") (str.to_re ".") (str.to_re "?") (str.to_re "+") (str.to_re "=") (str.to_re "&") (str.to_re "%") (str.to_re "@") (str.to_re "-") (str.to_re "/") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_")))) (str.to_re "/\u{a}"))))
(check-sat)
