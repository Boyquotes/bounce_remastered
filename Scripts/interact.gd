extends Node

func _kill_char(body):
	if body.get_name() == "char":
		global.lives-=1
		
		if (global.lives <= 0):
			get_tree().change_scene(str("res://Scenes/Generic/game_over.tscn"))
		else:
			get_tree().change_scene(str("res://Scenes/Maps/" + body.get_parent().get_name() + ".tscn"))

func _inflate_char(body):
	if body.get_name() == "char" and global.inflated == false:
		body.set_scale(Vector2(1.5, 1.5))
		global.inflated = true

func _deflate_char(body):
	if body.get_name() == "char" and global.inflated == true:
		body.set_scale(Vector2(1, 1))
		global.inflated = false

func _win(body):
	if body.get_name() == "char":
		if body.get_parent().get_name() == "map_classic_lv1":
			get_tree().change_scene(str("res://Scenes/Generic/game_won.tscn"))