extends Button 

func loadfn():
	var savegame: SaveGame = SaveGame.new()
	savegame = SaveGame.load_savegame()
	if not savegame == null:
		savegame.counterofdeath = 0
		savegame.write_savegame()

func _on_pressed_start():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://UI/lvlslct.tscn")

func _on_pressed_exit():
	get_tree().quit()


func _on_pressed_Contine():
	get_tree().paused = false
	get_parent().get_parent().get_parent().queue_free()

func _on_pressed_Mainmenu():
	loadfn()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://UI/menu.tscn")

func _on_pressed_RestartLevel():
	get_tree().paused = false
	get_parent().get_parent().get_parent().queue_free()
	get_tree().reload_current_scene()
