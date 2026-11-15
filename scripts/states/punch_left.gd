extends State

@export var hitbox:Hitbox2D

func _state_process(_delta:float) -> void:
	pass

func _state_ready() -> void:
	$"../../Punch".play()
	hitbox.disable = false
	state_machine.player_ref.animated_sprite_2d.play("Punch left")
	state_machine.player_ref.animated_sprite_2d.animation_finished.connect(go_idle, CONNECT_ONE_SHOT)

func go_idle() -> void:
	state_machine.set_state(state_machine.idle)

func _state_done() -> void:
	hitbox.disable = true
