(set-logic QF_SLIA)


(declare-fun var78 () String)
(declare-fun var79 () String)
(declare-fun var80 () String)
(declare-fun var82 () String)
(declare-fun var84 () String)
(declare-fun var85 () String)
(declare-fun var74 () String)
(declare-fun var75 () String)
(declare-fun var76 () String)

(assert (= true (str.in_re var82  (re.union  (re.++  (str.to_re "\u{3c}") (re.++ (re.*  (str.to_re " ") ) (re.++  (re.union  (str.to_re "S")  (str.to_re "s")) (re.++  (re.union  (str.to_re "C")  (str.to_re "c")) (re.++  (re.union  (str.to_re "R")  (str.to_re "r")) (re.++  (re.union  (str.to_re "I")  (str.to_re "i")) (re.++  (re.union  (str.to_re "P")  (str.to_re "p")) (re.++  (re.union  (str.to_re "T")  (str.to_re "t")) (re.++ (re.*  (str.to_re " ") ) (re.++  (str.to_re "\u{3e}") (re.++ (re.+  (re.union (re.range "a" "z") (re.union (re.range "A" "Z") (re.union (re.range "0" "9") (re.union  (str.to_re "\u{28}") (re.union  (str.to_re "\u{29}")  (str.to_re ";")))))) ) (re.++  (str.to_re "\u{3c}") (re.++  (str.to_re "/") (re.++ (re.*  (str.to_re " ") ) (re.++  (re.union  (str.to_re "S")  (str.to_re "s")) (re.++  (re.union  (str.to_re "C")  (str.to_re "c")) (re.++  (re.union  (str.to_re "R")  (str.to_re "r")) (re.++  (re.union  (str.to_re "I")  (str.to_re "i")) (re.++  (re.union  (str.to_re "P")  (str.to_re "p")) (re.++  (re.union  (str.to_re "T")  (str.to_re "t")) (re.++  (str.to_re " ")  (str.to_re "\u{3e}"))))))))))))))))))))))  (re.++  (str.to_re "\u{3c}") (re.++ (re.*  (str.to_re " ") ) (re.++  (re.union  (str.to_re "I")  (str.to_re "i")) (re.++  (re.union  (str.to_re "M")  (str.to_re "m")) (re.++  (re.union  (str.to_re "G")  (str.to_re "g")) (re.++  (str.to_re " ") (re.++  (re.union  (str.to_re "S")  (str.to_re "s")) (re.++  (re.union  (str.to_re "R")  (str.to_re "r")) (re.++  (re.union  (str.to_re "C")  (str.to_re "c")) (re.++  (str.to_re "=") (re.++  (re.union  (str.to_re "J")  (str.to_re "j")) (re.++  (re.union  (str.to_re "A")  (str.to_re "a")) (re.++  (re.union  (str.to_re "V")  (str.to_re "v")) (re.++  (re.union  (str.to_re "A")  (str.to_re "a")) (re.++  (re.union  (str.to_re "S")  (str.to_re "s")) (re.++  (re.union  (str.to_re "C")  (str.to_re "c")) (re.++  (re.union  (str.to_re "R")  (str.to_re "r")) (re.++  (re.union  (str.to_re "I")  (str.to_re "i")) (re.++  (re.union  (str.to_re "P")  (str.to_re "p")) (re.++  (re.union  (str.to_re "T")  (str.to_re "t")) (re.++  (str.to_re ":") (re.++ (re.+  (re.union (re.range "a" "z") (re.union (re.range "A" "Z") (re.union (re.range "0" "9") (re.union  (str.to_re "\u{28}") (re.union  (str.to_re "\u{29}")  (str.to_re ";")))))) ) (re.++ (re.*  (str.to_re " ") )  (str.to_re "\u{3e}"))))))))))))))))))))))))) ) ))
(assert (= true (= (str.++ var76 " \u{7d}" ) var75 ) ))
(assert (= true (= (str.++ var78 var79 ) var76 ) ))
(assert (= true (= (str.++ var80 "content: " ) var78 ) ))
(assert (= true (= (str.++ var82 "," ) var80 ) ))
(assert (= true (= (str.++ var84 var85 ) var82 ) ))
(assert (= true (= var75  var74 ) ))

(check-sat)
