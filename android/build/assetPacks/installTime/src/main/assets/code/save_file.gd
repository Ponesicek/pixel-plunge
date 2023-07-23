class_name SaveGame
extends Resource

#C:\Users\USER\AppData\Roaming\Godot\app_userdata\Game1

const SAVE_GAME_PATH := "user://savegame.tres"

@export var counterofdeath := 0
@export var time := [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

@export var deaths := [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
@export var coin := [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, ] 

func write_savegame() -> void:
	ResourceSaver.save(self, SAVE_GAME_PATH)

static func load_savegame() -> Resource:
	if ResourceLoader.exists(SAVE_GAME_PATH):
		return load(SAVE_GAME_PATH)
	return null

