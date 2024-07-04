(set-logic QF_SLIA)

(declare-const x String)
(declare-const y1 String)
(declare-const y2 String)


(assert (= x "abc\nefg  " ) )
(assert (= y1 "zzz" ) )


(check-sat)

