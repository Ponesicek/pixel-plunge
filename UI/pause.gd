extends Button

var screen
var x = false

func _ready():
	screen = preload("res://UI/pausescreen.tscn")
	x = screen.instantiate()
	



func _on_pressed():
	get_tree().paused = true
	screen = preload("res://UI/pausescreen.tscn")
	x = screen.instantiate()
	add_child(x)
