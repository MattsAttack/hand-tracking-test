extends Node3D

var remaining := 3.0

const SPEED = 3.0

func _ready():
	top_level = true #Ignores parents nodes movement 

func _process(delta):
	#Move along Z-
	position -= global_transform.basis.z * delta * SPEED
	
	#Check for remaining time
	remaining -= delta
	if remaining <= 0.0:
		#free if done
		queue_free()
