extends Area2D

@export var path: NodePath
var sendto

func _ready():
	sendto = get_node(path)

func collision_enter(_object):
	sendto.catch(true)

func collision_exit(_object):
	if get_overlapping_areas() == [] and get_overlapping_bodies() == []:
		sendto.catch(false)
	else:
		pass
