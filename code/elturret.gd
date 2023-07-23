extends StaticBody2D


@export var delay = 1.
@export var initdelay = 1.
@export var rinitdelay = false
@export var rdelay = false
@export var pointto = Vector2.ZERO
var ball
var x = 1

func _ready():
	$Sprite.rotation = $Sprite.get_angle_to( $Sprite.global_position + pointto)

func catch(y): 
	var scene = preload("res://scence/fireball.tscn")
	ball = scene.instantiate()
	x += 1
	add_child(ball)
	ball.dir = pointto
	ball.name = str(x)
