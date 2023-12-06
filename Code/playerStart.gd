extends Node3D
func _ready():
	$"../../Player".position = global_position
	$"../../Player".rotation = $Marker3D.global_rotation
