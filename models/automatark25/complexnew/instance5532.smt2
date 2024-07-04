(set-logic QF_SLIA)
(declare-const X String)
; /^Host\u{3a}\s*(194.192.14.125|202.75.58.179|flashupdates.info|nvidiadrivers.info|nvidiasoft.info|nvidiastream.info|rendercodec.info|syncstream.info|videosync.info)/smiH
(assert (not (str.in_re X (re.++ (str.to_re "/Host:") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.union (re.++ (str.to_re "194") re.allchar (str.to_re "192") re.allchar (str.to_re "14") re.allchar (str.to_re "125")) (re.++ (str.to_re "202") re.allchar (str.to_re "75") re.allchar (str.to_re "58") re.allchar (str.to_re "179")) (re.++ (str.to_re "flashupdates") re.allchar (str.to_re "info")) (re.++ (str.to_re "nvidiadrivers") re.allchar (str.to_re "info")) (re.++ (str.to_re "nvidiasoft") re.allchar (str.to_re "info")) (re.++ (str.to_re "nvidiastream") re.allchar (str.to_re "info")) (re.++ (str.to_re "rendercodec") re.allchar (str.to_re "info")) (re.++ (str.to_re "syncstream") re.allchar (str.to_re "info")) (re.++ (str.to_re "videosync") re.allchar (str.to_re "info"))) (str.to_re "/smiH\u{a}")))))
; User-Agent\u{3A}ChildWebGuardianHXDownloadX-Mailer\u{3a}
(assert (str.in_re X (str.to_re "User-Agent:ChildWebGuardianHXDownloadX-Mailer:\u{13}\u{a}")))
(check-sat)
