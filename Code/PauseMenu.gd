extends Control

func _on_settings_pressed():
	$Menu.popup()

func _on_resume_pressed():
	self.visible = false
	get_tree().paused=false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_save_pressed():
	$"../Save".save()

func _on_load_pressed():
	$"../Save"._load()

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Scenes/MenuScene.tscn")
