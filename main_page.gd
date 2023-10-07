extends Control

var register_page := load("res://register_page.tscn")
var login_page := load("res://login_page.tscn")


func _on_register_pressed() -> void:
	PageSwitcher.switch_to(register_page)


func _on_login_pressed() -> void:
	PageSwitcher.switch_to(login_page)
