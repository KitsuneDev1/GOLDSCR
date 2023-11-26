extends StaticBody3D

@export var health = 20
var gibs = preload("res://Prefab/GibsGlass.tscn")

func _process(delta):
	if(health <=0):
		Use()

func Use():
	var inst = gibs.instantiate()
	add_child(inst)
	inst.global_transform = $".".global_transform
	inst.reparent($".".get_parent())
	inst.scale = Vector3(1,1,1)
	self.queue_free()
