extends Control

var main_page := preload("res://main_page.tscn")
var message_center_page := preload("res://message_center_page.tscn")

func _ready() -> void:
	$Status.hide()


func _on_home_pressed() -> void:
	PageSwitcher.switch_to(main_page)


func _process(delta: float) -> void:
	if not $InputUsername.get_text().is_empty() and not $InputPassword.get_text().is_empty():
		$Login.set_disabled(false)
	else:
		$Login.set_disabled(true)


func _on_login_pressed() -> void:
	$Status.show()
	if Database.is_cred_valid($InputUsername.get_text(), $InputPassword.get_text()):
		$Status.set_text("Login successful")
		Session.login($InputPassword.get_text())
		PageSwitcher.switch_to(message_center_page)
	else:
		$Status.set_text("Incorrect username or password")
