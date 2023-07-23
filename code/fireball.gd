extends CharacterBody2D
class_name fireball
@onready var dir



func _physics_process(_delta):
	velocity = dir * 300
	$AnimatedSprite2D.play("anim")
	move_and_slide()


