extends Control


@export var page_name := "Page Name"

func _ready() -> void:
	$Title.set_text(page_name)
