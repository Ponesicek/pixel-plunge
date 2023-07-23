extends CharacterBody2D

class_name enemy;

var direction = 0;
const SPEED = 50.0
const JUMP_VELOCITY = -400.0
@onready var ray = $RayCast2D;
@onready var ray2 = $RayCast2D2
@onready var boxray = $boxray
@onready var boxray2 = $boxray2

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	if randf_range(-1, 1) > 1:
		direction = 1;
	else:
		direction = -1

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if !ray.is_colliding() or !ray2.is_colliding():
		direction *= -1
	
	if boxray.is_colliding():
		if not boxray.get_collider() is player:
			direction *= -1
	if boxray2.is_colliding():
		if  not boxray2.get_collider() is player:
			direction *= -1
			
	
	
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if direction:
		velocity.x = direction * SPEED
	
	if direction == 1:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
	
	$AnimatedSprite2D.play()
	move_and_slide()

