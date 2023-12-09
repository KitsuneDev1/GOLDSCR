extends Node3D

@export var ammoAmmount = 30

func _on_area_3d_body_entered(body):
	if(body.is_in_group("Player")):
		GlobalSettings.baseAmmo+=ammoAmmount
		self.queue_free()
