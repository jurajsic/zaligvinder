(set-logic QF_SLIA)


(declare-fun var1 () String)
(declare-fun var3 () String)
(declare-fun var4 () String)
(declare-fun var6 () String)
(declare-fun var7 () String)
(declare-fun var9 () String)
(declare-fun sv1 () String)
(declare-fun sv2 () String)

(assert (= true (= sv1 sv2 ) ))
(assert (= true (str.in_re var9 (re.++ (re.++ (re.++  (re.++ (re.* re.allchar ) (re.++  (str.to_re "'") (re.++ (re.+  (str.to_re " ") ) (re.++  (re.union  (str.to_re "O")  (str.to_re "o")) (re.++  (re.union  (str.to_re "R")  (str.to_re "r")) (re.++ (re.+  (str.to_re " ") )  (str.to_re "'"))))))) (str.to_re sv1) ) (re.++  (re.++  (str.to_re "'") (re.++ (re.* re.allchar ) (re.++  (str.to_re "=") (re.++ (re.* re.allchar )  (str.to_re "'"))))) (str.to_re sv2) ) )  (re.++  (str.to_re "'") (re.++ (re.*  (str.to_re " ") )  (re.union  (re.++  (str.to_re "\u{2d}")  (str.to_re "\u{2d}"))  (str.to_re "\u{23}")))) ) ) ))
(assert (= true (= var3 var1 ) ))
(assert (= true (= (str.++ var4 "%' AND ROWNUM \u{3c}= 50 ORDER BY tpcw_item\u{2e}i_title" ) var3 ) ))
(assert (= true (= (str.++ var6 var7 ) var4 ) ))
(assert (= true (= "SELECT \u{2a} FROM tpcw_author, tpcw_item WHERE tpcw_item\u{2e}i_a_id = tpcw_author\u{2e}a_id AND tpcw_author\u{2e}a_lname LIKE '" var6 ) ))
(assert (= true (= var7 var9 ) ))

(check-sat)
