extends Node

var user = OS.get_environment("USERNAME");
var path = "C://Users/" + user + "/Documents/KSSAVE/save.json"

func _load():
	var file = path
	var json_as_text = FileAccess.get_file_as_string(file)
	var json_as_dict = JSON.parse_string(json_as_text)
	if json_as_dict:
		$"..".Health = json_as_dict.health
		$"..".Armor = json_as_dict.armor
		get_tree().change_scene_to_file(json_as_dict.scene)
		Guns.hasBaseGun=json_as_dict.hasBaseGun
