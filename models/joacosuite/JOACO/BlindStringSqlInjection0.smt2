(set-logic QF_SLIA)


(declare-fun var5 () Bool)
(declare-fun var7 () String)
(declare-fun var8 () String)
(declare-fun var11 () String)
(declare-fun var4 () String)
(declare-fun var17 () String)
(declare-fun var18 () String)
(declare-fun sv1 () String)
(declare-fun sv2 () String)

(assert (= true (= sv1 sv2 ) ))
(assert (= true (str.in_re var11 (re.++ (re.++ (re.++  (re.++ (re.* re.allchar ) (re.++  (str.to_re "'") (re.++ (re.+  (str.to_re " ") ) (re.++  (re.union  (str.to_re "O")  (str.to_re "o")) (re.++  (re.union  (str.to_re "R")  (str.to_re "r")) (re.++ (re.+  (str.to_re " ") )  (str.to_re "'"))))))) (str.to_re sv1) ) (re.++  (re.++  (str.to_re "'") (re.++ (re.* re.allchar ) (re.++  (str.to_re "=") (re.++ (re.* re.allchar )  (str.to_re "'"))))) (str.to_re sv2) ) )  (re.++  (str.to_re "'") (re.++ (re.*  (str.to_re " ") )  (re.union  (re.++  (str.to_re "\u{2d}")  (str.to_re "\u{2d}"))  (str.to_re "\u{23}")))) ) ) ))
(assert (= true (= true var5 ) ))
(assert (= true (= (= var7 var8 ) var5 ) ))
(assert (= true (= var11  var7 ) ))
(assert (= true (= var17  var4 ) ))
(assert (= true (= (str.++ var18 var11 ) var17 ) ))
(assert (= true (= "SELECT \u{2a} FROM user_data WHERE userid =" var18 ) ))

(check-sat)
