extends CharacterBody2D

var tween
var tween2
var mplayer
var x

func _ready():
	position = get_parent().get_node("knightslime").position
	mplayer = get_parent().get_node("Player")
	tween = create_tween()
	tween.tween_property(self, "position:x", mplayer.position.x, 1)
	tween2 = create_tween()
	tween2.tween_property(self, "position:y", position.y - 75, 0.5).set_trans(Tween.TRANS_SINE)
	tween2.tween_property(self, "position:y", position.y, 0.5).set_trans(Tween.TRANS_SINE)
	tween2.connect("finished", end)

func end(): x = true

func _process(_delta):
	if x:
		if not is_on_floor(): velocity = Vector2(0, 75); move_and_slide()
		else:
			$AnimatedSprite2D.animation = "floor"
			$Area2D/air.disabled = true
			$Area2D/floor.disabled = false
			$AnimatedSprite2D.play("floor")
			$Timer.start(2)
			x = false
		
		
func delete():
	queue_free()
