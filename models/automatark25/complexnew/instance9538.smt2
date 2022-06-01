(declare-const X String)
; <\?xml.*</note>
(assert (str.in_re X (re.++ (str.to_re "<?xml") (re.* re.allchar) (str.to_re "</note>\u{a}"))))
; ^[a-zA-z0-9]+[@]{1}[a-zA-Z]+[.]{1}[a-zA-Z]+$
(assert (str.in_re X (re.++ (re.+ (re.union (re.range "a" "z") (re.range "A" "z") (re.range "0" "9"))) ((_ re.loop 1 1) (str.to_re "@")) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z"))) ((_ re.loop 1 1) (str.to_re ".")) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z"))) (str.to_re "\u{a}"))))
; ((<body)|(<BODY))([^>]*)>
(assert (not (str.in_re X (re.++ (re.union (str.to_re "<body") (str.to_re "<BODY")) (re.* (re.comp (str.to_re ">"))) (str.to_re ">\u{a}")))))
; Porta\s+SSKC\s+\.cfgmPOPrtCUSTOMPalToolbarUser-Agent\u{3A}
(assert (not (str.in_re X (re.++ (str.to_re "Porta") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "SSKC") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re ".cfgmPOPrtCUSTOMPalToolbarUser-Agent:\u{a}")))))
; <[^/bp][^><]*>|<p[a-z][^><]*>|<b[^r][^><]*>|<br[a-z][^><]*>|</[^bp]+>|</p[a-z]+>|</b[^r]+>|</br[a-z]+>
(assert (not (str.in_re X (re.++ (str.to_re "<") (re.union (re.++ (re.union (str.to_re "/") (str.to_re "b") (str.to_re "p")) (re.* (re.union (str.to_re ">") (str.to_re "<"))) (str.to_re ">")) (re.++ (str.to_re "p") (re.range "a" "z") (re.* (re.union (str.to_re ">") (str.to_re "<"))) (str.to_re ">")) (re.++ (str.to_re "b") (re.comp (str.to_re "r")) (re.* (re.union (str.to_re ">") (str.to_re "<"))) (str.to_re ">")) (re.++ (str.to_re "br") (re.range "a" "z") (re.* (re.union (str.to_re ">") (str.to_re "<"))) (str.to_re ">")) (re.++ (str.to_re "/") (re.+ (re.union (str.to_re "b") (str.to_re "p"))) (str.to_re ">")) (re.++ (str.to_re "/p") (re.+ (re.range "a" "z")) (str.to_re ">")) (re.++ (str.to_re "/b") (re.+ (re.comp (str.to_re "r"))) (str.to_re ">")) (re.++ (str.to_re "/br") (re.+ (re.range "a" "z")) (str.to_re ">\u{a}")))))))
(check-sat)
