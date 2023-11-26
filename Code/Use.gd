extends Node3D
func _process(delta):
	if($RayCast3D.is_colliding() and Input.is_action_just_pressed("Use")):
		var hit = $RayCast3D.get_collider()
		print(hit)
		if(hit.get_parent().get_parent().has_method("Use")):
				hit.get_parent().get_parent().Use()
