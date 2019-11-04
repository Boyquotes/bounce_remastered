extends Node

func _kill_char(body):
	if body.get_name() == "char":
		global.lives-=1
		
		if (global.lives <= 0):
			get_tree().change_scene(str("res://Scenes/game_over.tscn"))
		else:
			get_tree().change_scene(str("res://Scenes/Maps/" + body.get_parent().get_name() + ".tscn"))

func _inflate_char(body):
	if body.get_name() == "char" and global.inflated is false:
		sprite.scale(Vector2(1.5, 1.5))
		global.inflated = true

func _deflate_char(body):
	if body.get_name() == "char" and global.inflated is true:
		sprite.scale(Vector2(1, 1))
		global.inflated = false

func _win(body):
	if body.get_name() == "char":
		if body.get_parent().get_name() == "map_classic_lv1":
			get_tree().change_scene(str("res://Scenes/Maps/map_classic_lv2.tscn"))
			
		elif body.get_parent().get_name() == "map_classic_lv2":
			get_tree().change_scene(str("res://Scenes/game_won.tscn"))