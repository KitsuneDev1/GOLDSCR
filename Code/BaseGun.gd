extends Node3D

@onready var sparks = preload("res://Assets/sparks.tscn")

@onready var hitRay : RayCast3D = get_node("HitRay")

@export var range = 20

var canShoot = true

func _ready():
	hitRay.target_position = Vector3(0,range *-1,0)

func _process(_delta):
	if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		if(canShoot):
			Shoot()

func Shoot():
	$SFX.play()
	$FireRateTimer.start()
	canShoot=false
	$Flash.visible = true
	$FlashTimer.start()
	if(hitRay.is_colliding()):
		if(hitRay.get_collider().is_in_group("Solid")):
			var inst = sparks.instantiate()
			add_child(inst)
			inst.global_position = hitRay.get_collision_point()
			inst.emitting = true
			inst.reparent($"../..".get_parent())

func _on_flash_timer_timeout():
	$Flash.visible = false

func _on_fire_rate_timer_timeout():
	canShoot=true
