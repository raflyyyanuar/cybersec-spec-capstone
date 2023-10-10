extends Control


func _ready() -> void:
	$FromLabel.set_text(Session.message[1])
	$ContentLabel.set_text(Session.message[2])


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://message_center_page.tscn")
