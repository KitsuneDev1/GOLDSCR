extends Node3D

@export var targets : Array[Node3D] = []
var used = false

func _on_area_3d_body_entered(body):
	if(!used and body.is_in_group("Player")):
		used = true
		for i in targets:
			i.Use()
