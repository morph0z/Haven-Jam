extends State

@export var hurtbox:Hurtbox2D

func _state_process(_delta:float) -> void:
	pass

func _state_ready() -> void:
	$"../../Weave".play()
	hurtbox.disable = true
	state_machine.player_ref.animated_sprite_2d.play("Weave left")
	state_machine.player_ref.animated_sprite_2d.animation_finished.connect(go_idle, CONNECT_ONE_SHOT)
	
	state_machine.input_handler.punch_left.connect(do_punch_left)
	state_machine.input_handler.punch_right.connect(do_punch_right)

func do_punch_left() -> void:
	await state_machine.player_ref.animated_sprite_2d.animation_finished
	state_machine.set_state(state_machine.punch_left)
	
func do_punch_right() -> void:
	await state_machine.player_ref.animated_sprite_2d.animation_finished
	state_machine.set_state(state_machine.punch_right)

func go_idle() -> void:
	state_machine.set_state(state_machine.idle)

func _state_done() -> void:
	state_machine.input_handler.punch_left.disconnect(do_punch_left)
	state_machine.input_handler.punch_right.disconnect(do_punch_right)
	hurtbox.disable = false
