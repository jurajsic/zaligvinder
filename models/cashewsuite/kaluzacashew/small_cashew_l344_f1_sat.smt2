(set-logic QF_SLIA)


(declare-fun v0 () String)

(assert (not (= v0 (str.++ "A" (str.++ "B" (str.++ "A" (str.++ "C" (str.++ "D" (str.++ "E" (str.++ "D" (str.++ "F" (str.++ "A" "G"))))))))))))

(check-sat)

