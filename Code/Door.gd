extends Node3D

@export var autoCloseTimer = 5
@export var autoClose = true
@export var canUseByPlayer = true

var closed = true

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
