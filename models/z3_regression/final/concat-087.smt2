(set-logic QF_SLIA)

(declare-const X String)
(declare-const Y String)

(assert (= (str.++ X (str.++ "ab" Y ) ) (str.++ Y (str.++ "ba" X ) ) ) )
(assert (= 2 (str.len X) ) )

(check-sat)
