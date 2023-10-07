extends Node

var username : String = ""


func login(u : String) -> void:
	username = u


func logout() -> void:
	username = ""
