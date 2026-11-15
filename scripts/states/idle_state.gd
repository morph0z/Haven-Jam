extends State

@onready var steam: CPUParticles2D = $"../../steam"

var cant_punch:bool = false

func _state_process(_delta:float) -> void:
	pass

func _state_ready() -> void:
	state_machine.input_handler.weave_left.connect(do_weave_left)
	state_machine.input_handler.weave_right.connect(do_weave_right)
	
	state_machine.input_handler.punch_left.connect(do_punch_left)
	state_machine.input_handler.punch_right.connect(do_punch_right)
	state_machine.player_ref.animated_sprite_2d.play("Idle")

func do_weave_left() -> void:
	state_machine.set_state(state_machine.weave_left)

func do_weave_right() -> void:
	state_machine.set_state(state_machine.weave_right)

func do_punch_left() -> void:
	if cant_punch: return
	state_machine.set_state(state_machine.punch_left)
	
func do_punch_right() -> void:
	if cant_punch: return
	state_machine.set_state(state_machine.punch_right)

func _state_done() -> void:
	state_machine.input_handler.weave_left.disconnect(do_weave_left)
	state_machine.input_handler.weave_right.disconnect(do_weave_right)
	
	state_machine.input_handler.punch_left.disconnect(do_punch_left)
	state_machine.input_handler.punch_right.disconnect(do_punch_right)


func _on_state_machine_spamming() -> void:
	steam.emitting = true
	cant_punch = true
	await get_tree().create_timer(5).timeout
	steam.emitting = false
	cant_punch = false
	
