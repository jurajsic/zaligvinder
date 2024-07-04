(set-logic QF_SLIA)


(declare-fun v0 () String)

(assert (= v0 (str.++ "A" (str.++ "B" (str.++ "C" (str.++ "D" (str.++ "B" (str.++ "E" (str.++ "F" (str.++ "A" (str.++ "G" "H")))))))))))

(check-sat)

