extends Node
func _process(delta):
	if($RayCast3D.is_colliding()):
		print("sddc")
	if($RayCast3D.is_colliding() and Input.is_action_just_pressed("Use")):
		var hit = $RayCast3D.get_collider()
		if(hit.get_parent().get_parent().has_method("Use")):
			if(hit.get_parent().get_parent().canUseByPlayer):
				hit.get_parent().get_parent().Use()
