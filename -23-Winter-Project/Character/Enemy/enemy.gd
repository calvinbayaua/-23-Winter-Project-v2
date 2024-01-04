extends "res://Character/Character.gd"

class_name Enemy

# Initialize target on player class selection
@onready var target = get_node("/root/World/Rogue")
signal attacking

var damage
var attack_speed
