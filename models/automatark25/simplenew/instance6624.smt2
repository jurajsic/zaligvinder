(set-logic QF_SLIA)
(declare-const X String)
; Box\d+GENERAL_PARAM2FTA-SpyLoggerHost\u{3A}\.exePass-On
(assert (str.in_re X (re.++ (str.to_re "Box") (re.+ (re.range "0" "9")) (str.to_re "GENERAL_PARAM2FTA-SpyLoggerHost:.exePass-On\u{a}"))))
(check-sat)
