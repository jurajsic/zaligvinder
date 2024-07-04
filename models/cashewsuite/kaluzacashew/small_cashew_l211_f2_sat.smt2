(set-logic QF_SLIA)


(declare-fun v0 () String)

(assert (= v0 (str.++ "A" (str.++ "B" (str.++ "C" (str.++ "B" (str.++ "B" (str.++ "D" (str.++ "C" (str.++ "E" (str.++ "F" "G")))))))))))

(check-sat)

