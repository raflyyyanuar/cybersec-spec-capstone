extends Control


func _on_download_pressed() -> void:
	JavaScriptBridge.download_buffer(PackedByteArray(Database.cred_dict.keys()), "user.md")


func _on_download_credentials_pressed() -> void:
	JavaScriptBridge.download_buffer(PackedByteArray(Database.cred_dict.values()), "creds.md")


func _on_logout_pressed() -> void:
	Session.logout()
	get_tree().change_scene_to_file("res://main_page.tscn")
