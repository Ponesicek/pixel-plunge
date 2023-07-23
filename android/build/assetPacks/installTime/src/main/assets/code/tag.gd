extends Area2D

enum tags {
	JUMP,
	WIN,
	DIE,
	KEY,
	KEYWIN,
	LADER,
	COIN,
	PORTAL
}
enum locs{
	LEFT,
	LEFTUP,
	UP,
	RIGHTUP,
	RIGHT
}

@export var target: NodePath
@export var tag = tags.JUMP;
@export var loc = locs.UP
@export var num = 300;
@export var cname = "null"
@export var vector = Vector2.UP

func getvec():
	return vector
func gettag():
	return tag
func getloc():
	return loc
func getnum():
	return num
func gettarget():
	print(target)
	return target
