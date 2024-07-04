import sys

REPLACEMENTS = {"re.complement" : "re.comp",
				"int.to.str" : "str.from_int",
				"str.to.int" : "str.to_int",
				"str.in.re" : "str.in_re",
				"str.to.re" : "str.to_re",
				"re.nostr" : "re.none",
				";(set-logic ALL_SUPPORTED)" : "(set-logic QF_SLIA)",
				"(set-logic ALL)" : "(set-logic QF_SLIA)",
				"(get-model)" : "",
				"(set-info :status sat)" : "",
				"(set-info :status unsat)" : "",
				"(set-option :produce-models true)" : "",
				"(set-option :strings-exp true)" : "",
				"(set-option :auto-config true)" : "",
				}

file_name = sys.argv[1]
with open(file_name, "r+") as file:
	content=file.read()
	for r, w in REPLACEMENTS.items():
		content = content.replace(r, w)
	if "(set-logic" not in content:
		content = "(set-logic QF_SLIA)\n" + content
	file.seek(0)
	file.write(content)
	file.truncate()
