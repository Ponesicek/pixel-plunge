extends StaticBody2D

@export var initdelay = 2.
@onready var timer = $Timer
@onready var timermisc = $Timer2
@export var howmuctiles = 3.
@export var movespeed = 2
@export var delay = 1.
var go = false
var go2 = false
var initloc = Vector2.ZERO
var targetloc = Vector2.ZERO
var deltaself

func _ready():
	initloc = global_position
	targetloc.y = initloc.y + howmuctiles * 16
	targetloc.x = initloc.x
	timer.start(initdelay)


func _process(_delta):
		if go and global_position.y <= targetloc.y - movespeed:
			global_position.y += movespeed
		elif go:
			timermisc.start(delay)
			go = false
		if go2:
			if global_position.y >= initloc.y + movespeed:
				global_position.y -= movespeed
			else:
				go2 = false
				timer.start(delay)



func catch(x: bool):
	if x:
		go = true
		go2 = false
	else:
		go = false
		go2 = true
