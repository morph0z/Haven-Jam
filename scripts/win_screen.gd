extends Control

@onready var label_3: Label = $ColorRect/Label3

var combo:int
var time:int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label_3.text = "SCORE: " + str(combo * time * 100)
