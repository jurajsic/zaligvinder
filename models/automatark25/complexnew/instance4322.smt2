(declare-const X String)
; ^((.){1,}(\d){1,}(.){0,})$
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") (re.+ re.allchar) (re.+ (re.range "0" "9")) (re.* re.allchar)))))
; /\u{3d}\u{a}$/P
(assert (not (str.in_re X (str.to_re "/=\u{a}/P\u{a}"))))
; ^http\://[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(/\S*)?$
(assert (not (str.in_re X (re.++ (str.to_re "http://") (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "-") (str.to_re "."))) (str.to_re ".") ((_ re.loop 2 3) (re.union (re.range "a" "z") (re.range "A" "Z"))) (re.opt (re.++ (str.to_re "/") (re.* (re.comp (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")))))) (str.to_re "\u{a}")))))
; /xsl\u{3A}template[^\u{3E}]*priority\s*\u{3D}[\s\u{22}\u{27}]*[\d\u{2D}]*[^\s\u{22}\u{27}\d\u{2d}]/smi
(assert (str.in_re X (re.++ (str.to_re "/xsl:template") (re.* (re.comp (str.to_re ">"))) (str.to_re "priority") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "=") (re.* (re.union (str.to_re "\u{22}") (str.to_re "'") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.* (re.union (re.range "0" "9") (str.to_re "-"))) (re.union (str.to_re "\u{22}") (str.to_re "'") (re.range "0" "9") (str.to_re "-") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "/smi\u{a}"))))
; /\u{2e}pdf([\?\u{5c}\u{2f}]|$)/smiU
(assert (not (str.in_re X (re.++ (str.to_re "/.pdf") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}")))))
(check-sat)
