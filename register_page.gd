extends Control

var main_page := preload("res://main_page.tscn")


func _on_home_pressed() -> void:
	PageSwitcher.switch_to(main_page)


func _on_register_pressed() -> void:
	pass # Replace with function body.


func _on_input_username_text_submitted(new_text: String) -> void:
	pass # Replace with function body.


func _on_input_password_text_submitted(new_text: String) -> void:
	pass # Replace with function body.


func contains_uppercase(password):
	var uppercase_pattern = "[A-Z]"
	var regex = RegEx.new()
	regex.compile(uppercase_pattern)

	return regex.search(password) != null

func contains_number(password):
	var number_pattern = "\\d"
	var regex = RegEx.new()
	regex.compile(number_pattern)
	
	return regex.search(password) != null


func contains_symbol(password):
	var symbol_pattern ="[!@#=$%^&*()_+{}\\[\\]:;<>,.?~\\-\\\\/\'\"|`]"
	var regex = RegEx.new()
	regex.compile(symbol_pattern)
	
	return regex.search(password) != null


func has_length_of(password : String, length : int = 8):
	return password.length() >= length


func check(check_function : Callable, password : String, check_label : Label):
	if check_function.call(password):
		check_label.modulate = Color.WHITE
	else:
		check_label.modulate = Color.RED


func _on_input_password_text_changed(new_text: String) -> void:
	# check all the password requirements
	check(contains_uppercase, new_text, $LettersRequirement)
	check(contains_number, new_text, $NumberRequirement)
	check(contains_symbol, new_text, $SymbolRequirement)
	check(has_length_of, new_text, $LengthRequirement)
