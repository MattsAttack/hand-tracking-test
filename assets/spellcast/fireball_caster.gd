extends Node3D

const FIREBALL := preload("res://assets/spellcast/FireBall.tscn")

var _parent_controller : XRController3D

var _cast_fireball := false

func _ready():
	var _parent_controller := get_parent() as XRController3D
	print(_parent_controller)

func _process(_delta):
	
	if not _parent_controller:
		return
	
	#check if fireball gesture is new
	var old_cast_fireball := _cast_fireball
	_cast_fireball = _parent_controller.is_button_pressed("fireball")
	if _cast_fireball and not old_cast_fireball:
		print("FIREBALL")
		var fireball := FIREBALL.instantiate()
		add_child(fireball)
		fireball.global_transform = global_transform
