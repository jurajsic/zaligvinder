(set-logic QF_SLIA)
(declare-const X String)
; HANDYHost\u{3a}Host\u{3a}Host\u{3A}yddznydqir\u{2f}eviGatornewsSoftActivity
(assert (not (str.in_re X (str.to_re "HANDYHost:Host:Host:yddznydqir/eviGatornewsSoftActivity\u{13}\u{a}"))))
; ed2k\u{c0}STATUS\u{c0}Server\u{7D}\u{7B}Port\u{3A}http\u{3A}\u{2F}\u{2F}tv\u{2E}seekmo\u{2E}com\u{2F}showme\u{2E}aspx\u{3F}keyword=
(assert (str.in_re X (str.to_re "ed2k\u{c0}STATUS\u{c0}Server\u{13}}{Port:http://tv.seekmo.com/showme.aspx?keyword=\u{a}")))
(check-sat)
