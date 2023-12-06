extends Control

func _ready():
	$Panel/Timer.start()
	$Panel/AnimationPlayer.play("Action")

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/MenuScene.tscn")
