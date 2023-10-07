extends Node

var page_stack : Array[PackedScene] = []

func switch_to(packed_scene : PackedScene) -> void:
	get_tree().change_scene_to_packed(packed_scene)

func go_back() -> void:
	get_tree().unload_current_scene()
