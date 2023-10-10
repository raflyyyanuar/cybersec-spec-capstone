extends Node

var username : String = ""
var message : Array = []

func login(u : String) -> void:
	username = u


func logout() -> void:
	username = ""
	message = []


func set_message(m : Array):
	message = m


