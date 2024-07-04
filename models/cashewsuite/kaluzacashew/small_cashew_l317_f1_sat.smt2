(set-logic QF_SLIA)


(declare-fun v0 () String)

(assert (not (= v0 (str.++ "A" (str.++ "B" (str.++ "C" (str.++ "D" (str.++ "D" (str.++ "E" (str.++ "F" (str.++ "C" (str.++ "F" "G"))))))))))))

(check-sat)

