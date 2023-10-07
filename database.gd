extends Node

# Credentials dictionary
var cred_dict = {}

func add_cred(username : String, password : String) -> void:
	if cred_dict.has(username):
		print("Username already exists!")
	else:
		cred_dict[username] = password.sha256_text()



