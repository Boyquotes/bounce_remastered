extends LinkButton

func _option_new_game():
	get_tree().change_scene(str("res://Scenes/Maps/map_classic_lv1.tscn"))

func _option_quit():
	get_tree().quit()

func _option_return_to_main_menu():
	get_tree().change_scene(str("res://Scenes/main_menu.tscn"))
	global.lives = 3
	global.inflated = false