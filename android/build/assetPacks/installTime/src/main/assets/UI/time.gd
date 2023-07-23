extends Label

@onready var time = 1

func _physics_process(delta):
	time += delta
	text = "%02d : %02d : %02d" % [fmod(time, 60*60) / 60, fmod(time,60), fmod(time, 1)*1000]
	
