extends Button



func _ready():
	var y = preload("res://Sprites/diamond.png")
	var savegame: SaveGame = SaveGame.new()
	savegame = SaveGame.load_savegame()
	var time = savegame.time[int(str(self.name))]
	text = self.name + "\n" + "deaths: " + str(savegame.deaths[int(str(self.name))]) + "\n" + "best time: " + "%02d : %02d : %02d" % [fmod(time, 60*60) / 60, fmod(time,60), fmod(time, 1)*1000]
	if savegame.coin[int(str(self.name))]:
		$TextureRect.texture = y
	pressed.connect(onclick)


func onclick():
	get_tree().change_scene_to_file("res://levels/" + str(self.name) + ".tscn")
