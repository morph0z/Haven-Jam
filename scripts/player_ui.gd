extends Control
class_name PlayerUi
@onready var label: Label = $Label
@export var beats:MusicHandler

var combo_number:int
var health_number:int

var incTime:int = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	label.text = "COMBO: " + str(combo_number) + "\n
	HEALTH: " + str(health_number) + "\n
	TIME: " + str(incTime)
