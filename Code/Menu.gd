extends Control

func _ready():
	Input.mouse_mode=Input.MOUSE_MODE_VISIBLE

func _on_config_pressed():
	$Menu.popup()

func _on_exit_pressed():
	get_tree().quit()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/exampleScene.tscn")

func _on_play_mouse_entered():
	$"../SFX".play()

func _on_config_mouse_entered():
	$"../SFX".play()

func _on_exit_mouse_entered():
	$"../SFX".play()
