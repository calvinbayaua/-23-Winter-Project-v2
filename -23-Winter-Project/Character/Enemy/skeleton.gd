extends "res://Character/Enemy/enemy.gd"

class_name Skeleton

var attack_range = 50


func _ready():
	SPEED = 100
	
	damage = 5
	attack_speed = 1
	
	change_state(STATES.RUN)


func _physics_process(delta):
	if current_state != STATES.ATTACK:
		$AnimatedSprite2D.play("run")
		movement()
		move_and_slide()
		
		# Sprite control
		if direction.x > 0:
			$AnimatedSprite2D.flip_h = false
		elif direction.x < 0:
			$AnimatedSprite2D.flip_h = true
		
		# Start attack sequence if the target is within range
		if global_position.distance_to(target.global_position) <= attack_range:
			emit_signal("attacking")


# Basic movement
func movement():
	direction = global_position.direction_to(target.global_position)
	velocity = direction * SPEED


# Starts attack timer
func _on_attacking():
	$AnimatedSprite2D.play("idle")
	change_state(STATES.ATTACK)
	$AttackSpeed.start(attack_speed)


# Target takes damage if still within attack range
func _on_attack_speed_timeout():
	if global_position.distance_to(target.global_position) <= attack_range:
		target.take_damage(damage)
	
	change_state(STATES.RUN)
