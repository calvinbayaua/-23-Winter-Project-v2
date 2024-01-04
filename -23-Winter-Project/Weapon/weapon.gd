extends Area2D

class_name Weapon

enum STATES {IDLE, ATTACK}
var current_state
var previous_state

@export var damage = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	current_state = STATES.IDLE
	previous_state = null

func change_state(new_state):
	previous_state = current_state
	current_state = new_state
