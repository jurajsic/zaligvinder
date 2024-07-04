(set-logic QF_SLIA)

(declare-const aPosition Int)
(declare-const secondPos Int)
(declare-const aURL String)

(assert (= "http://www.tizag.com/www.html" aURL) )
(assert (= secondPos (str.indexof  aURL  "www" (- 0 10) ) ) )


(check-sat)

