extends Node

@export var pixelAmmount = 2
var scene = "null"
var _hasBaseGun = false
func _ready():
	scene = "res://Scenes/MenuScene.tscn"

func change_display_mode(toggle):
	if !toggle:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
func change_Vsycn(toggle):
	if(toggle):
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		
#AUDIO

func update_master(bus_index,volume):
	AudioServer.set_bus_volume_db(bus_index,volume)
