extends Node3D
@export var ammount = 30
func _on_area_3d_body_entered(body):
	if(body.is_in_group("Player")):
		body._takeDamage(ammount)
