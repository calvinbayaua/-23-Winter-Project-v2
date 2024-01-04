extends "res://Character/Character.gd"

class_name Player


func movement(delta):
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
