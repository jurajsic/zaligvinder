(set-logic QF_SLIA)


(declare-fun var1 () String)
(declare-fun var2 () String)
(declare-fun var3 () String)
(declare-fun var4 () String)
(declare-fun var7 () String)
(declare-fun var8 () String)
(declare-fun var6 () String)
(declare-fun sv7 () Int)
(declare-fun sv8 () Int)

(assert (= true (>= sv7 sv8 ) ))
(assert (= true (str.in_re var7 (re.++ (re.++ (re.++  (re.++ (re.+ (re.range "0" "9") ) (re.++ (re.+  (str.to_re " ") ) (re.++  (re.union  (str.to_re "O")  (str.to_re "o")) (re.++  (re.union  (str.to_re "R")  (str.to_re "r")) (re.+  (str.to_re " ") ))))) (str.to_re (str.from_int sv7 )) )  (re.++ (re.+  (str.to_re " ") ) (re.++  (str.to_re "\u{3e}") (re.++  (str.to_re "=") (re.+  (str.to_re " ") )))) ) (str.to_re (str.from_int sv8 )) ) ) ))
(assert (= true (= var2  var1 ) ))
(assert (= true (= (str.++ var3 var4 ) var2 ) ))
(assert (= true (= "select c_business_name from customer where c_id =" var3 ) ))
(assert (= true (not (= var8 var7 )) ))
(assert (= true (= var6 var7 ) ))
(assert (= true (= var4 var6 ) ))

(check-sat)
