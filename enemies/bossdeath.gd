extends Area2D
var coin
func loadfn(savegame):
	return savegame.load_savegame()

func _on_area_entered(area):
	if get_parent().get_parent().get_node("Player").coin:
		coin = true
	var savegame: SaveGame = SaveGame.new()
	savegame = loadfn(savegame)
	if coin and not savegame == null:
		if get_parent().get_parent().get_node("Player").time < savegame.time[int(str(get_tree().current_scene.name))] or savegame.time[int(str(get_tree().current_scene.name))] == 0:
			savegame.time[int(str(get_tree().current_scene.name))] = get_parent().get_parent().get_node("Player").time
		savegame.coin[int(str(get_tree().current_scene.name))] = true

	if not savegame == null:
		savegame.counterofdeath = 0

	var time = get_parent().get_parent().get_node("Player").time
	savegame.write_savegame()
	get_parent().get_parent().get_node("UI").queue_free()
	get_tree().paused = true
	
	get_tree().paused = false
	get_tree().change_scene_to_file("res://UI/menu.tscn")
