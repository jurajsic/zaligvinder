(set-logic QF_SLIA)
(declare-const X String)
; /^ver\u{3a}Ghost\s+version\s+\d+\u{2E}\d+\s+server/smi
(assert (str.in_re X (re.++ (str.to_re "/ver:Ghost") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "version") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.+ (re.range "0" "9")) (str.to_re ".") (re.+ (re.range "0" "9")) (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "server/smi\u{a}"))))
; ^[9]9\d{10}|^[5]\d{10}
(assert (not (str.in_re X (re.union (re.++ (str.to_re "99") ((_ re.loop 10 10) (re.range "0" "9"))) (re.++ (str.to_re "5") ((_ re.loop 10 10) (re.range "0" "9")) (str.to_re "\u{a}"))))))
; zmnjgmomgbdz\u{2f}zzmw\.gzt\d+Ready
(assert (str.in_re X (re.++ (str.to_re "zmnjgmomgbdz/zzmw.gzt") (re.+ (re.range "0" "9")) (str.to_re "Ready\u{a}"))))
; /filename=[^\n]*\u{2e}aom/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".aom/i\u{a}")))))
; smrtshpr-cs-.*TPSystem\s+dist\u{2E}atlas\u{2D}ia\u{2E}com
(assert (not (str.in_re X (re.++ (str.to_re "smrtshpr-cs-\u{13}") (re.* re.allchar) (str.to_re "TPSystem") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "dist.atlas-ia.com\u{a}")))))
(check-sat)
