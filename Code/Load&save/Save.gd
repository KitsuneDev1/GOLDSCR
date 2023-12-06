extends Node

var health = 0
var armor = 0
var scene = ""
var hasBaseGun = false
var user = OS.get_environment("USERNAME");
var save_path = "C://Users/" + user + "/Documents/KSSAVE/saveks.save"

func _ready():
	DirAccess.make_dir_absolute("C://Users/" + user + "/Documents/KSSAVE")
	
func save():
	$"../Control/SaveAnim".play("Anim")
	hasBaseGun=GlobalSettings._hasBaseGun
	health=$"..".Health
	armor=$"..".Armor
	var file = FileAccess.open(save_path,FileAccess.WRITE)
	file.store_var(health)
	file.store_var(armor)
	file.store_var(scene)
	file.store_var(hasBaseGun)
func _load():
	if(FileAccess.file_exists(save_path)):
		var file = FileAccess.open(save_path,FileAccess.READ)
		get_tree().change_scene_to_file(scene)
		$"..".Health = file.get_var(health)
		$"..".Armor = file.get_var(armor)
		GlobalSettings._hasBaseGun=hasBaseGun
