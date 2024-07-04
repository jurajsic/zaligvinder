(set-logic QF_SLIA)


(declare-fun v0 () String)

(assert (= v0 (str.++ "A" (str.++ "B" (str.++ "C" (str.++ "D" (str.++ "D" (str.++ "E" (str.++ "F" (str.++ "G" (str.++ "H" "I")))))))))))

(check-sat)

