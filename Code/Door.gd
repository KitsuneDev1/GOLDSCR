extends Node3D

@export var autoCloseTimer = 5
@export var autoClose = true

var closed = true

func _ready():
	$Timer.wait_time=autoCloseTimer

func Use():
	if(closed==true):
		$Animator.play("Open")
		closed=false
		if(autoClose):
			$Timer.start()
	else:
		$Animator.play("Close")
		closed=true
		
func _on_timer_timeout():
	$Animator.play("Close")
	closed=true
