extends FPSController3D
class_name Player

## Example script that extends [CharacterController3D] through 
## [FPSController3D].
## 
## This is just an example, and should be used as a basis for creating your 
## own version using the controller's [b]move()[/b] function.
## 
## This player contains the inputs that will be used in the function 
## [b]move()[/b] in [b]_physics_process()[/b].
## The input process only happens when mouse is in capture mode.
## This script also adds submerged and emerged signals to change the 
## [Environment] when we are in the water.

@export var input_back_action_name := "move_backward"
@export var input_forward_action_name := "move_forward"
@export var input_left_action_name := "move_left"
@export var input_right_action_name := "move_right"
@export var input_sprint_action_name := "move_sprint"
@export var input_jump_action_name := "move_jump"
@export var input_crouch_action_name := "move_crouch"
@export var input_fly_mode_action_name := "move_fly_mode"

@export var underwater_env: Environment

@export var canMove = true
var death = false
var Health = 100
var Armor = 100

func _ready():
	$Save.scene=get_tree().current_scene.scene_file_path
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	setup()
	emerged.connect(_on_controller_emerged.bind())
	submerged.connect(_on_controller_subemerged.bind())


func _physics_process(delta):
	var is_valid_input := Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED
	
	if is_valid_input:
		if Input.is_action_just_pressed(input_fly_mode_action_name):
			fly_ability.set_active(not fly_ability.is_actived())
		var input_axis = Input.get_vector(input_back_action_name, input_forward_action_name, input_left_action_name, input_right_action_name)
		var input_jump = Input.is_action_just_pressed(input_jump_action_name)
		var input_crouch = Input.is_action_pressed(input_crouch_action_name)
		var input_sprint = Input.is_action_pressed(input_sprint_action_name)
		var input_swim_down = Input.is_action_pressed(input_crouch_action_name)
		var input_swim_up = Input.is_action_pressed(input_jump_action_name)
		if(canMove):
			move(delta, input_axis, input_jump, input_crouch, input_sprint, input_swim_down, input_swim_up)
	else:
		# NOTE: It is important to always call move() even if we have no inputs 
		## to process, as we still need to calculate gravity and collisions.
		move(delta)

func _input(event: InputEvent) -> void:
	# Mouse look (only if the mouse is captured).
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_head(event.relative)


func _on_controller_emerged():
	camera.environment = null


func _on_controller_subemerged():
	camera.environment = underwater_env
	
func _process(delta):
	if(Input.is_action_just_pressed("Load")):
		$Save._load()
	if(Input.is_action_just_pressed("Save")):
		$Save.save()
		$Save.scene=get_tree().current_scene.scene_file_path
	if(death and Input.is_anything_pressed()):
		$Save._load()
	if(Health>100):
		Health = 100
	if(Armor>100):
		Armor=100
	if(Armor<0):
		Armor=0
	if(Health<=0):
		Health=0
		_death()
	$Control/Panel/Health.text = ("HEALTH:" + str(Health))
	$Control/Panel/Armor.text = ("ARMOR: " + str(Armor))
	if(Input.is_action_just_pressed("Pause")):
		$Pause.visible=true
		get_tree().paused=true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _heal(ammount):
	if(Health>100):
		Health=100
	else:
		Health+=ammount
func _healBattery(ammount):
	if(Armor>100):
		Armor=100
	else:
		Armor+=ammount
		
func _takeDamage(ammount):
	if(Armor>0):
		Armor-=ammount
	else:
		Health-=ammount
		
func _death():
	$Death/DeathCam.make_current()
	canMove=false
	$Head/BaseGun.visible=false
	$Head/BaseGun.process_mode=Node.PROCESS_MODE_DISABLED
	$Death/Control/DeathOverlay.visible=true
	$Death/Control/AnimationPlayer.play("Action")
	death=true
