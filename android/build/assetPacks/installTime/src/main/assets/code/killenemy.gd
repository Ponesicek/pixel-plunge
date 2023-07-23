extends Area2D



func _on_body_entered(body):
	if body is player:
		body.velocity.y = -150
		get_parent().queue_free()
