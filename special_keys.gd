extends Node

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("open_command"):
		get_tree().change_scene_to_file("res://database_page.tscn")
