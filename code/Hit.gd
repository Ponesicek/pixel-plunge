extends Area2D
var vector = Vector2.ZERO;
var savegame: SaveGame = SaveGame.load_savegame()
var x;
var y;

func add_death():
	if not savegame == null:
		savegame.counterofdeath += 1
		savegame.deaths[int(str(get_tree().current_scene.name))] += 1
		savegame.write_savegame()
	else:
		savegame.counterofdeath = 1
	savegame.write_savegame()



func _on_body_entered(body):
	death(body)
func _on_area_entered(area):
	select(area)

func select(body):
	if body.gettag() == 0:
		JumpAbilityPad(body)
	elif body.gettag() == 1:
		win(body)
	elif body.gettag() == 2:
		death(body)
	elif body.gettag() == 3:
		setkey(body)
	elif body.gettag() == 4:
		can_open(body)
	elif body.gettag() == 6:
		setcoin(body)
	elif body.gettag() == 7:
		portal(body)

func win(_body):
	var screen = preload("res://UI/end_screen.tscn")
	x = screen.instantiate()
	add_child(x)


func JumpAbilityPad(body):
	vector = body.getvec() * body.getnum() * 10
	get_parent().setvel(vector)
	
	vector = Vector2.ZERO

									#death

func death(body):
	print(body)
	get_tree().reload_current_scene()
	add_death()

func setkey(body):
	get_parent().get_parent().get_node("UI").get_node("Control3").get_node("Key").visible = true
	self.get_parent().key = true;
	body.get_parent().queue_free()

func can_open(body):
	if get_parent().key == true:
		win(body)

func setcoin(body):
	get_parent().get_parent().get_node("UI").get_node("Control3").get_node("Coin").visible = true
	self.get_parent().coin = true;
	body.get_parent().queue_free()

func portal(body):
	for x in get_tree().get_nodes_in_group("portal"):
		if x.y == body.get_parent().get_parent().y and x != body.get_parent().get_parent():
			get_parent().global_position = x.global_position
			get_parent().velocity = Vector2.ZERO;
			x.tptimer()
