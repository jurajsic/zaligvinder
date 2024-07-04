(set-logic QF_SLIA)


(declare-fun v0 () String)

(assert (not (= v0 (str.++ "A" (str.++ "B" (str.++ "C" (str.++ "D" (str.++ "E" (str.++ "A" (str.++ "F" (str.++ "G" (str.++ "H" "I"))))))))))))

(check-sat)

