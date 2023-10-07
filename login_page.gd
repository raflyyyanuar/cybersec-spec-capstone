extends Control

var main_page := preload("res://main_page.tscn")

func _on_home_pressed() -> void:
	PageSwitcher.switch_to(main_page)

