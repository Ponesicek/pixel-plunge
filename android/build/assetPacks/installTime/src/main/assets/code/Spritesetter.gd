extends Sprite2D



func _ready():
	get_parent().rotation = get_parent().get_angle_to( get_parent().global_position + $Area2D.getvec()) + 1.57079633
	
