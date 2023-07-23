extends CharacterBody2D
class_name boss

var health
var tween
var tween2
var mplayer
var randomnummber
var ball
var x
var scene
var timer
func _ready():
	x=0
	mplayer = get_parent().get_node("Player")
	select()
	

func jump():
	tween = create_tween()
	tween.tween_property(self, "position:x", mplayer.position.x, 1)
	tween2 = create_tween()
	tween2.tween_property(self, "position:y", position.y - 75, 0.5).set_trans(Tween.TRANS_SINE)
	tween2.tween_property(self, "position:y", position.y, 0.5).set_trans(Tween.TRANS_SINE)
	tween2.connect("finished", delay)
	
func select():
	if position.x - mplayer.position.x == abs(position.x - mplayer.position.x):
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false

	randomize()
	randomnummber = randf_range(0, 1)
	randomnummber = round(randomnummber)
	print(randomnummber)
	if randomnummber == 0:
		jump()
	elif randomnummber == 1:
		spawnprojectile()
	else:
		jump()

func spawnprojectile():
	scene = preload("res://scence/projectile.tscn")
	ball = scene.instantiate()
	x += 1
	get_parent().add_child.call_deferred(ball)
	ball.name = str(x)
	delay(1.5)

func delay(x = 1):
	$delay.start(x)




