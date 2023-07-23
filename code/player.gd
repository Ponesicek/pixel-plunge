extends CharacterBody2D

class_name player


var direction
@export var SPEED = 15000.0 / 2
@export var JUMP_VELOCITY = -400.0 / 2 
var can_jump = true
@onready var raycast = $picker
var holding = false
var holdingobj
@onready var timer = $timer
var can_hold = true
var ui
var key = false
var coin = false
var shouldgravity = true
var time = 0
var shouldspring = false
var springammount = Vector2.ZERO
var springammountleft = Vector2.ZERO
const springnum = 13


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func setvel(num):
	shouldspring = true
	springammount = num
	springammountleft = springnum;

func holdingtick():

	if holding:
		holdingobj.set_global_position(global_position + Vector2(0, -18))

func pickup():
	if not holding:
		if raycast.get_collider() is box:
			holdingobj = raycast.get_collider()
			can_jump = false
			holding = true
			raycast.get_collider().holded = true
			raycast.get_collider().set_global_position(global_position + Vector2(0, -18))
	else:
		if not raycast.is_colliding():
			holding = false
			holdingobj.holded = false
			holdingobj.set_global_position(global_position + Vector2(raycast.target_position.x, -10))
			can_jump = true

func _physics_process(delta):
	time += delta
	# Add the gravity.
	if not is_on_floor() and shouldgravity:
		velocity.y += gravity * delta

	#handle pause
	if Input.is_action_just_pressed("ui_pause"):
		get_tree().paused = true
		var screen = preload("res://UI/pausescreen.tscn")
		var x = screen.instantiate()
		add_child(x)
		
	if Input.is_action_just_pressed("ui_restart"):
		get_tree().reload_current_scene()
	
	if Input.is_action_pressed("ui_pickup"):
		if can_hold:
			can_hold = false
			pickup()
			timer.start(0.2)
			
	
	# Handle Jump.
	if Input.is_action_pressed("ui_accept") and is_on_floor() and can_jump:
		velocity.y = JUMP_VELOCITY

	if Input.is_action_pressed("ui_accept") and can_jump and $laderdetect.is_colliding():
		shouldgravity = false
		velocity.y = -100
	else:
		shouldgravity = true


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		$AnimatedSprite2D.animation = "run"
		velocity.x = direction * SPEED * delta
		if direction < 0:
			$AnimatedSprite2D.flip_h = true
			raycast.target_position = Vector2(-25, 0)
		else:
			$AnimatedSprite2D.flip_h = false
			raycast.target_position = Vector2(25, 0)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.animation = "idle"
	
	
	$AnimatedSprite2D.play()
	if not is_on_floor():
		if velocity.y > 0:
			$AnimatedSprite2D.animation = "jump"
			$AnimatedSprite2D.frame = 1
		else: 
			$AnimatedSprite2D.animation = "jump"
			$AnimatedSprite2D.frame = 0
	
	holdingtick()
	
	if shouldspring:
		if springammountleft > 0:
				velocity = springammount / springnum;
				springammountleft -= 1;
		else: 
			shouldspring = false;
	
	move_and_slide()

func _on_timer_timeout():
	can_hold = true
