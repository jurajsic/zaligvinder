(declare-const X String)
; (^.+\|+[A-Za-z])
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") (re.+ re.allchar) (re.+ (str.to_re "|")) (re.union (re.range "A" "Z") (re.range "a" "z"))))))
; /\u{2e}wax([\?\u{5c}\u{2f}]|$)/smiU
(assert (str.in_re X (re.++ (str.to_re "/.wax") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}"))))
; User-Agent\u{3a}User-Agent\u{3A}
(assert (str.in_re X (str.to_re "User-Agent:User-Agent:\u{a}")))
; ^[\(]? ([^0-1]){1}([0-9]){2}([-,\),/,\.])*([ ])?([^0-1]){1}([0-9]){2}[ ]?[-]?[/]?[\.]? ([0-9]){4}$
(assert (str.in_re X (re.++ (re.opt (str.to_re "(")) (str.to_re " ") ((_ re.loop 1 1) (re.range "0" "1")) ((_ re.loop 2 2) (re.range "0" "9")) (re.* (re.union (str.to_re "-") (str.to_re ",") (str.to_re ")") (str.to_re "/") (str.to_re "."))) (re.opt (str.to_re " ")) ((_ re.loop 1 1) (re.range "0" "1")) ((_ re.loop 2 2) (re.range "0" "9")) (re.opt (str.to_re " ")) (re.opt (str.to_re "-")) (re.opt (str.to_re "/")) (re.opt (str.to_re ".")) (str.to_re " ") ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}"))))
; ^-?((([0-9]{1,3},)?([0-9]{3},)*?[0-9]{3})|([0-9]{1,3}))\.[0-9]*$
(assert (str.in_re X (re.++ (re.opt (str.to_re "-")) (re.union (re.++ (re.opt (re.++ ((_ re.loop 1 3) (re.range "0" "9")) (str.to_re ","))) (re.* (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re ","))) ((_ re.loop 3 3) (re.range "0" "9"))) ((_ re.loop 1 3) (re.range "0" "9"))) (str.to_re ".") (re.* (re.range "0" "9")) (str.to_re "\u{a}"))))
(check-sat)
