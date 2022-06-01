(declare-const X String)
; /^(\d{1,2})(\/)(\d{1,2})(\/)(\d{4})(T|\s{1,2})(([0-1][0-9])|(2[0-3])):([0-5][0-9])+$/;
(assert (str.in_re X (re.++ (str.to_re "/") ((_ re.loop 1 2) (re.range "0" "9")) (str.to_re "/") ((_ re.loop 1 2) (re.range "0" "9")) (str.to_re "/") ((_ re.loop 4 4) (re.range "0" "9")) (re.union (str.to_re "T") ((_ re.loop 1 2) (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")))) (re.union (re.++ (re.range "0" "1") (re.range "0" "9")) (re.++ (str.to_re "2") (re.range "0" "3"))) (str.to_re ":") (re.+ (re.++ (re.range "0" "5") (re.range "0" "9"))) (str.to_re "/;\u{a}"))))
; <[ \t]*[iI][mM][gG][ \t]*[sS][rR][cC][ \t]*=[ \t]*['\"]([^'\"]+)
(assert (not (str.in_re X (re.++ (str.to_re "<") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}"))) (re.union (str.to_re "i") (str.to_re "I")) (re.union (str.to_re "m") (str.to_re "M")) (re.union (str.to_re "g") (str.to_re "G")) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}"))) (re.union (str.to_re "s") (str.to_re "S")) (re.union (str.to_re "r") (str.to_re "R")) (re.union (str.to_re "c") (str.to_re "C")) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}"))) (str.to_re "=") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}"))) (re.union (str.to_re "'") (str.to_re "\u{22}")) (re.+ (re.union (str.to_re "'") (str.to_re "\u{22}"))) (str.to_re "\u{a}")))))
; /filename=[^\n]*\u{2e}jpm/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".jpm/i\u{a}")))))
; Toolbar\w+SoftActivitypassword\u{3B}0\u{3B}Incorrect
(assert (str.in_re X (re.++ (str.to_re "Toolbar") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "SoftActivity\u{13}password;0;Incorrect\u{a}"))))
(check-sat)
