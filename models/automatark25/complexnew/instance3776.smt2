(set-logic QF_SLIA)
(declare-const X String)
; ^\$(\d{1,3}(\,\d{3})*|(\d+))(\.\d{2})?$
(assert (str.in_re X (re.++ (str.to_re "$") (re.union (re.++ ((_ re.loop 1 3) (re.range "0" "9")) (re.* (re.++ (str.to_re ",") ((_ re.loop 3 3) (re.range "0" "9"))))) (re.+ (re.range "0" "9"))) (re.opt (re.++ (str.to_re ".") ((_ re.loop 2 2) (re.range "0" "9")))) (str.to_re "\u{a}"))))
; /filename=[^\n]*\u{2e}exe/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".exe/i\u{a}"))))
; ^(.*?)([^/\\]*?)(\.[^/\\.]*)?$
(assert (not (str.in_re X (re.++ (re.* re.allchar) (re.* (re.union (str.to_re "/") (str.to_re "\u{5c}"))) (re.opt (re.++ (str.to_re ".") (re.* (re.union (str.to_re "/") (str.to_re "\u{5c}") (str.to_re "."))))) (str.to_re "\u{a}")))))
; AdTools\d+rprpgbnrppb\u{2f}ciExplorer\u{2F}sto=notificationfindwww\u{2E}makemesearch\u{2E}com
(assert (str.in_re X (re.++ (str.to_re "AdTools") (re.+ (re.range "0" "9")) (str.to_re "rprpgbnrppb/ciExplorer/sto=notification\u{13}findwww.makemesearch.com\u{a}"))))
(check-sat)
