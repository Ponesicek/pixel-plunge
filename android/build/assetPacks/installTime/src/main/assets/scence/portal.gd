extends StaticBody2D
class_name portal
var y;
var oy;

func tptimer():
	y = 0;
	$Timer.start(0.2)

func _ready():
	y = $Portal/Area2D.getnum()
	oy = y

func _on_timer_timeout():
	y = oy;
