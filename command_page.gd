extends Control


func _enter_tree() -> void:
	get_parent().hide()


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("open_command"):
		get_parent().show()


func _on_exit_pressed() -> void:
	get_parent().hide()
