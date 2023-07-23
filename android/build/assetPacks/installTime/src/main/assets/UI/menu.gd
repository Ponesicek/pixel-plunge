extends Control

func _ready():
	if FileAccess.file_exists("user://savegame.tres"):
		print("1")
	else:
		var savegame: SaveGame = SaveGame.new()
		savegame.write_savegame()
