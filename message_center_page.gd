extends Control


func _ready() -> void:
	# greet the user
	$Greeting.set_text("Welcome, " + Session.username + "!")
	
	# fetch messages
	var messages = Database.fetch_messages(Session.username)
	# message = [id, who, what]
	for m in messages:
		print("You have a message from " + m[1])
		var button = Button.new()
		$MessageList.add_child(button)
		button.set_text("Message from " + m[1])
		button.pressed.connect(_on_view_message_button_pressed.bind(m))


func _on_view_message_button_pressed(message : Array):
	print(message)


func _on_compose_pressed() -> void:
	get_tree().change_scene_to_file("res://compose_message_page.tscn")


func _on_logout_pressed() -> void:
	Session.logout()
	get_tree().change_scene_to_file("res://main_page.tscn")
