extends CharacterBody2D

class_name box
var holded = false

func _physics_process(_delta):
	if not is_on_floor() and not holded:
		velocity = Vector2(0, 100)
	move_and_slide()
