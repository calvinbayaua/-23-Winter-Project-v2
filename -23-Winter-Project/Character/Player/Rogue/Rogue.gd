extends "res://Character/Player/Player.gd"

class_name Rogue

var dodge_speed = 3500
var can_dodge = true


func _physics_process(delta):
	# Movement control
	movement(delta)
	dodge(delta)
	move_and_slide()
	
	# Animation control
	if direction.x == 0 && direction.y == 0:
		change_state(STATES.IDLE)
		$AnimatedSprite2D.play("idle")
	else:
		change_state(STATES.RUN)
		if direction.x > 0:
			$AnimatedSprite2D.flip_h = false
#			if $Dagger/Marker2D/Sprite2D.position.x < 0:
#				$Dagger/Marker2D/Sprite2D.position.x = -$Dagger/Marker2D/Sprite2D.position.x
#				$Dagger/Marker2D/Sprite2D.flip_v = false
#				$Dagger/Marker2D/Sprite2D.flip_h = false
		elif direction.x < 0:
			$AnimatedSprite2D.flip_h = true
#			if $Dagger/Marker2D/Sprite2D.position.x > 0:
#				$Dagger/Marker2D/Sprite2D.position.x = -$Dagger/Marker2D/Sprite2D.position.x
#				$Dagger/Marker2D/Sprite2D.flip_v = true
#				$Dagger/Marker2D/Sprite2D.flip_h = true
		$AnimatedSprite2D.play("run")

# Spacebar: Slides the player in a given direction
func dodge(delta):
	if Input.is_action_just_pressed("dodge") && can_dodge:
		$Dodge.start()
		velocity += direction * dodge_speed
		can_dodge = false

# Adds a cooldown to the dodge
func _on_dodge_timeout():
	can_dodge = true
