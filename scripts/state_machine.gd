class_name StateMachine
extends Node

var current_state:State
@export var player_ref:player
@export var input_handler:InputHandler

@export var idle: State
@export var punch_left: State
@export var punch_right: State
@export var weave_left: State
@export var weave_right: State

signal state_changed(old_state:State, new_state:State)

var spam_prev:int = 0

signal spamming

func _ready() -> void:
	set_state(idle)

func set_state(new_state: State) -> void:
	if current_state: current_state._state_done()
	state_changed.emit(current_state, new_state)
	current_state = new_state
	new_state._state_ready()
	
	if (new_state == punch_left) or (new_state == punch_right):
		spam_prev += 1
		$Timer.start()
		if spam_prev > 3:
			spamming.emit()

func get_state() -> State: return current_state


func _on_timer_timeout() -> void:
	spam_prev = 0
