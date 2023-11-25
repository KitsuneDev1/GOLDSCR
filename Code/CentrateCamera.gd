extends Camera3D

func _process(delta):
	$".".global_transform = $"../../../../Head/Camera".global_transform
