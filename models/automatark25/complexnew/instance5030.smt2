(set-logic QF_SLIA)
(declare-const X String)
; (Jan(uary)?|Feb(ruary)?|Mar(ch)?|Apr(il)?|May|Jun(e)?|Jul(y)?|Aug(ust)?|Sep(tember)?|Oct(ober)?|(Nov|Dec)(ember)?)
(assert (str.in_re X (re.++ (re.union (re.++ (str.to_re "Jan") (re.opt (str.to_re "uary"))) (re.++ (str.to_re "Feb") (re.opt (str.to_re "ruary"))) (re.++ (str.to_re "Mar") (re.opt (str.to_re "ch"))) (re.++ (str.to_re "Apr") (re.opt (str.to_re "il"))) (str.to_re "May") (re.++ (str.to_re "Jun") (re.opt (str.to_re "e"))) (re.++ (str.to_re "Jul") (re.opt (str.to_re "y"))) (re.++ (str.to_re "Aug") (re.opt (str.to_re "ust"))) (re.++ (str.to_re "Sep") (re.opt (str.to_re "tember"))) (re.++ (str.to_re "Oct") (re.opt (str.to_re "ober"))) (re.++ (re.union (str.to_re "Nov") (str.to_re "Dec")) (re.opt (str.to_re "ember")))) (str.to_re "\u{a}"))))
; /Expression\u{28}\s*?GetClass\u{28}\u{22}sun.awt.SunToolkit\u{22}\u{29}\s*?,\s*?\u{22}getField\u{22}/smi
(assert (not (str.in_re X (re.++ (str.to_re "/Expression(") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "GetClass(\u{22}sun") re.allchar (str.to_re "awt") re.allchar (str.to_re "SunToolkit\u{22})") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re ",") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "\u{22}getField\u{22}/smi\u{a}")))))
; SAccsearchresltOnline100013Agentsvr\u{5E}\u{5E}Merlin
(assert (str.in_re X (str.to_re "SAccsearchresltOnline100013Agentsvr^^Merlin\u{13}\u{a}")))
(check-sat)
