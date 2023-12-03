extends Node

func _process(_delta):
	if(Input.is_action_just_pressed("ChangeToWeapon1")):
		if(Guns.hasBaseGun):
			changeToBase()
	if(Input.is_action_just_pressed("ChangeToWeapon2")):
		print(null)
		#do nothing

func _ready():
	changeToNULL()

func changeToNULL():
	$"../BaseGun".visible=false
	$"../BaseGun".process_mode=Node.PROCESS_MODE_DISABLED

func changeToBase():
	$"../BaseGun".visible=true
	$"../BaseGun".process_mode=Node.PROCESS_MODE_INHERIT
