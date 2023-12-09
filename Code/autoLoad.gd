extends Node3D

var user = OS.get_environment("USERNAME");
var save_path = "C://Users/" + user + "/Documents/KSSAVE/saveks.save"
var health = 0
var armor = 0
@export var lvName="[Example scene]"
func _ready():
	get_tree().paused=false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if(FileAccess.file_exists(save_path)):
		var file = FileAccess.open(save_path,FileAccess.READ)
		$Player.Health = file.get_var(health)
		$Player.Armor = file.get_var(armor)
