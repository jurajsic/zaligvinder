(set-logic QF_SLIA)


(declare-fun v0 () String)

(assert (not (= v0 (str.++ "A" (str.++ "B" (str.++ "B" (str.++ "C" (str.++ "D" "E"))))))))

(check-sat)

