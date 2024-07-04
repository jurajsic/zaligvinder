(set-logic QF_SLIA)


(declare-fun v0 () String)

(assert (not (= v0 (str.++ "A" (str.++ "B" (str.++ "C" (str.++ "D" (str.++ "C" (str.++ "E" (str.++ "E" (str.++ "F" (str.++ "E" "G"))))))))))))

(check-sat)

