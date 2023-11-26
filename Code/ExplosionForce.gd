extends Node3D

@export var targets : Array[RigidBody3D] = []
@export var force=0.5

func _ready():
	for i in targets:
		i.apply_force(Vector3(randi_range(1,10)*force,randi_range(1,10)*force,randi_range(1,10)*force))
