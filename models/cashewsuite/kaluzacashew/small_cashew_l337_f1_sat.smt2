(set-logic QF_SLIA)


(declare-fun v0 () String)

(assert (= v0 (str.++ "A" (str.++ "B" (str.++ "C" (str.++ "A" (str.++ "D" (str.++ "A" (str.++ "E" (str.++ "F" (str.++ "G" "H")))))))))))

(check-sat)

