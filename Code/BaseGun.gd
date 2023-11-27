extends Node3D

@onready var sparks = preload("res://Assets/sparks.tscn")

@export var range = 20

var canShoot = true

func _ready():
	$Mesh/HitRay.target_position = Vector3(0,range *-1,0)

func _process(_delta):
	if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		if(canShoot):
			Shoot()

func Shoot():
	$Animator.play("Shoot")
	$SFX.play()
	$FireRateTimer.start()
	canShoot=false
	$Mesh/Flash.visible = true
	$FlashTimer.start()
	if($Mesh/HitRay.is_colliding()):
		if($Mesh/HitRay.get_collider().is_in_group("Solid")):
			var inst = sparks.instantiate()
			add_child(inst)
			inst.global_position = $Mesh/HitRay.get_collision_point()
			inst.emitting = true
			inst.reparent($"../..".get_parent())
		if($Mesh/HitRay.get_collider().is_in_group("Breakable")):
			$Mesh/HitRay.get_collider()._takeDamage(25)
func _on_flash_timer_timeout():
	$Mesh/Flash.visible = false

func _on_fire_rate_timer_timeout():
	canShoot=true
