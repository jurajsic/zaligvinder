(declare-const X String)
; ^(([^,\n]+),([^,\n]+),([^@]+)@([^\.]+)\.([^,\n]+)\n)+([^,\n]+),([^,\n]+),([^@]+)@([^\.]+)\.([^,\n]+)\n?$
(assert (str.in_re X (re.++ (re.+ (re.++ (re.+ (re.union (str.to_re ",") (str.to_re "\u{a}"))) (str.to_re ",") (re.+ (re.union (str.to_re ",") (str.to_re "\u{a}"))) (str.to_re ",") (re.+ (re.comp (str.to_re "@"))) (str.to_re "@") (re.+ (re.comp (str.to_re "."))) (str.to_re ".") (re.+ (re.union (str.to_re ",") (str.to_re "\u{a}"))) (str.to_re "\u{a}"))) (re.+ (re.union (str.to_re ",") (str.to_re "\u{a}"))) (str.to_re ",") (re.+ (re.union (str.to_re ",") (str.to_re "\u{a}"))) (str.to_re ",") (re.+ (re.comp (str.to_re "@"))) (str.to_re "@") (re.+ (re.comp (str.to_re "."))) (str.to_re ".") (re.+ (re.union (str.to_re ",") (str.to_re "\u{a}"))) (re.opt (str.to_re "\u{a}")) (str.to_re "\u{a}"))))
; ([0-9]{4})-([0-9]{1,2})-([0-9]{1,2})
(assert (not (str.in_re X (re.++ ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 1 2) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 1 2) (re.range "0" "9")) (str.to_re "\u{a}")))))
(check-sat)
