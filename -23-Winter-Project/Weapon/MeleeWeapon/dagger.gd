extends "res://Weapon/MeleeWeapon/melee_weapon.gd"

class_name Dagger


func _physics_process(delta):
	look_at(get_global_mouse_position())


func _on_attack_speed_timeout():
	set_collision_mask_value(2, true)
	$AnimationPlayer.play("attack")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "attack":
		set_collision_mask_value(2, false)


func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
