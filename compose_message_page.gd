extends Control




func _process(delta: float) -> void:
	if not $ToLineEdit.get_text().is_empty() and not $ContentTextEdit.get_text().is_empty():
		$Send.set_disabled(false)
	else:
		$Send.set_disabled(true)


func _on_send_pressed() -> void:
	Database.send_message(Session.username, $ToLineEdit.get_text(), $ContentTextEdit.get_text())
	get_tree().change_scene_to_file("res://message_center_page.tscn")
