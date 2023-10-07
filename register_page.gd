extends Control

var main_page := preload("res://main_page.tscn")


func _ready() -> void:
	$UsernameAvailability.hide()
	$Status.hide()


func _process(delta: float) -> void:
	if is_username_available($InputUsername.get_text()) and is_password_good($InputPassword.get_text()):
		$Register.set_disabled(false)
	else:
		$Register.set_disabled(true)


func _on_home_pressed() -> void:
	PageSwitcher.switch_to(main_page)


func _on_register_pressed() -> void:
	# add username
	$Status.show()
	$Status.set_text("Registered successfully")
	Database.add_cred($InputUsername.get_text(), $InputPassword.get_text())
	$InputUsername.clear()
	$InputPassword.clear()


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
		return 1
	else:
		check_label.modulate = Color.RED
		return 0


func is_username_available(username : String) -> bool:
	$UsernameAvailability.show()
	if Database.exists(username):
		$UsernameAvailability.set_text("Username already exists")
		return false
	else:
		$UsernameAvailability.set_text("Username is available")
		return true


func is_password_good(password : String) -> bool:
	# check all the password requirements
	var password_score := 0
	
	password_score += check(contains_uppercase, password, $LettersRequirement)
	password_score += check(contains_number, password, $NumberRequirement)
	password_score += check(contains_symbol, password, $SymbolRequirement)
	password_score += check(has_length_of, password, $LengthRequirement)
	
	# return password_score == 4
	return not password.is_empty()
