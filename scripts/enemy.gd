extends Node2D
class_name Enemy2D
@export var animated_sprite_2d: AnimatedSprite2D
@export var bg_finish:ColorRect
@export var cpu_particles_2d_2: CPUParticles2D

signal defeated

func warning(how_long:float) -> Signal:
	var warning_done:Signal
	animated_sprite_2d.play("flash")
	await get_tree().create_timer(how_long).timeout
	animated_sprite_2d.play("Idle")
	return warning_done

func defeat():

	Engine.time_scale = 0.3

	animated_sprite_2d.play("Idle")
	cpu_particles_2d_2.emitting = true
	var tween:Tween = create_tween()
	tween.tween_property(bg_finish, "color", Color.WHITE, 0.01)
	
	await get_tree().create_timer(0.4).timeout
	
	Engine.time_scale = 1
	
	var tween2:Tween = create_tween()
	tween2.tween_property(bg_finish, "color", Color.TRANSPARENT, 0.01)
	
	await tween2.finished
	
	defeated.emit()
	
	queue_free()
