extends Node

# Credentials dictionary
var cred_dict = {}

# rafly : password, [inbox]
# inbox -> id, who, what

func add_cred(username : String, password : String) -> void:
	if cred_dict.has(username):
		print("Username already exists!")
	else:
		cred_dict[username] = [password.sha256_text(), []]


func exists(username : String) -> bool:
	return cred_dict.has(username)


func is_cred_valid(username : String, password : String) -> bool:
	return cred_dict.has(username) and cred_dict[username][0] == password.sha256_text()


func send_message(from : String, to : String, what : String) -> void:
	if not exists(to):
		return
	
	# message = id, from, what
	var id = len(cred_dict[to][1])
	var message = [id, from, what]
	
	cred_dict[to][1].append(message)


func fetch_messages(username : String) -> Array:
	if not exists(username):
		return []
	
	return cred_dict[username][1]
