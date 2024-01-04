extends CharacterBody2D

class_name Character

@export var HP = 100
@export var SPEED = 350

var direction

enum STATES {IDLE, RUN, ATTACK, STAGGER, DEAD}
var current_state
var previous_state


func _ready():
	current_state = STATES.IDLE
	previous_state = null


func change_state(new_state):
	previous_state = current_state
	current_state = new_state
	
	match current_state:
		STATES.DEAD:
			queue_free()


func take_damage(damage):
	HP -= damage
	$AnimatedSprite2D/AnimationPlayer.play("flash_damage")
	if HP <= 0:
		change_state(STATES.DEAD)
	else:
		change_state(STATES.STAGGER)
