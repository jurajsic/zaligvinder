(set-logic QF_SLIA)


(declare-fun v0 () String)

(assert (= v0 (str.++ "A" (str.++ "A" (str.++ "B" (str.++ "C" (str.++ "D" (str.++ "E" (str.++ "F" (str.++ "G" (str.++ "H" "I")))))))))))
(assert (= v0 (str.++ "J" (str.++ "K" (str.++ "A" (str.++ "L" (str.++ "M" (str.++ "J" (str.++ "N" (str.++ "O" (str.++ "P" "Q")))))))))))

(check-sat)

