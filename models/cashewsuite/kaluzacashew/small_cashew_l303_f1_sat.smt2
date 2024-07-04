(set-logic QF_SLIA)


(declare-fun v0 () String)

(assert (not (= v0 (str.++ "A" (str.++ "B" (str.++ "C" (str.++ "D" (str.++ "E" (str.++ "B" (str.++ "F" (str.++ "G" (str.++ "E" "H"))))))))))))

(check-sat)

