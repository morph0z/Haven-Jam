class_name State
extends Node

@onready var state_machine:StateMachine = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if state_machine.current_state == self:
		_state_ready()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if state_machine.current_state == self:
		self._state_process(delta)

func _state_process(_delta:float) -> void:
	pass

func _state_ready() -> void:
	pass

func _state_done() -> void:
	pass
