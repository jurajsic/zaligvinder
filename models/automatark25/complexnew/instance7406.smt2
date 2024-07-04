(set-logic QF_SLIA)
(declare-const X String)
; (^\d{1,3}([,]\d{3})*$)|(^\d{1,16}$)
(assert (not (str.in_re X (re.union (re.++ ((_ re.loop 1 3) (re.range "0" "9")) (re.* (re.++ (str.to_re ",") ((_ re.loop 3 3) (re.range "0" "9"))))) (re.++ ((_ re.loop 1 16) (re.range "0" "9")) (str.to_re "\u{a}"))))))
; /load\.php\?spl=(Spreadsheet|DirectX_DS|MS09-002|MS06-006|mdac|RoxioCP v3\.2|wvf|flash|Opera_telnet|compareTo|jno|Font_FireFox|pdf_exp|aol|javad|ActiveX_pack)/U
(assert (str.in_re X (re.++ (str.to_re "/load.php?spl=") (re.union (str.to_re "Spreadsheet") (str.to_re "DirectX_DS") (str.to_re "MS09-002") (str.to_re "MS06-006") (str.to_re "mdac") (str.to_re "RoxioCP v3.2") (str.to_re "wvf") (str.to_re "flash") (str.to_re "Opera_telnet") (str.to_re "compareTo") (str.to_re "jno") (str.to_re "Font_FireFox") (str.to_re "pdf_exp") (str.to_re "aol") (str.to_re "javad") (str.to_re "ActiveX_pack")) (str.to_re "/U\u{a}"))))
; Subject\u{3A}\d+media\u{2E}dxcdirect\u{2E}com\.smx\?PASSW=SAHHost\u{3A}
(assert (not (str.in_re X (re.++ (str.to_re "Subject:") (re.+ (re.range "0" "9")) (str.to_re "media.dxcdirect.com.smx?PASSW=SAHHost:\u{a}")))))
; ^\d{5}((-|\s)?\d{4})?$
(assert (not (str.in_re X (re.++ ((_ re.loop 5 5) (re.range "0" "9")) (re.opt (re.++ (re.opt (re.union (str.to_re "-") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 4 4) (re.range "0" "9")))) (str.to_re "\u{a}")))))
; frame_ver2\s+communityLibrarySoftwareWinCrashcomHost\u{3A}tid\u{3D}\u{25}toolbar\u{5F}id
(assert (str.in_re X (re.++ (str.to_re "frame_ver2") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "communityLibrarySoftwareWinCrashcomHost:tid=%toolbar_id\u{a}"))))
(check-sat)
