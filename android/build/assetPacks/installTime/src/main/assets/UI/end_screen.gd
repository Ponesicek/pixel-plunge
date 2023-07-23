extends Control

var settexture = preload("res://Sprites/diamond.png")
var coin

func loadfn(savegame):
	return savegame.load_savegame()

func _ready():
	if get_parent().get_parent().get_parent().get_node("Player").coin:
		coin = true
		$HBoxContainer/VBoxContainer2/TextureRect.texture = settexture
	else:
		coin = false
	var savegame: SaveGame = SaveGame.new()
	savegame = loadfn(savegame)
	if coin and not savegame == null:
		if get_parent().get_parent().get_parent().get_node("Player").time < savegame.time[int(str(get_tree().current_scene.name))] or savegame.time[int(str(get_tree().current_scene.name))] == 0:
			savegame.time[int(str(get_tree().current_scene.name))] = get_parent().get_parent().get_parent().get_node("Player").time
		savegame.coin[int(str(get_tree().current_scene.name))] = true

	if not savegame == null:
		var Dcounter = $HBoxContainer/VBoxContainer3/DeathCounter
		Dcounter.text = "deaths: " + str(savegame.counterofdeath)
		savegame.counterofdeath = 0

	var time = get_parent().get_parent().get_parent().get_node("Player").time
	$HBoxContainer/VBoxContainer2/Label.text = "%02d : %02d : %02d" % [fmod(time, 60*60) / 60, fmod(time,60), fmod(time, 1)*1000]
	savegame.write_savegame()
	get_parent().get_parent().get_parent().get_node("UI").queue_free()
	get_tree().paused = true

func _on_button_pressed():
	var strl = str(get_parent().get_tree().current_scene.name)
	strl = int(strl) + 1
	get_tree().paused = false
	var lvl = "res://levels/"
	lvl += str(strl)
	lvl += ".tscn"
	get_tree().change_scene_to_file(lvl)


func _on_button_Exit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://UI/menu.tscn")


func _on_button_restart_pressed():
	get_tree().paused = false
	get_parent().get_parent().queue_free()
	get_tree().reload_current_scene()
