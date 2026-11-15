class_name InputHandler
extends Node

signal weave_left
signal weave_right

signal punch_left
signal punch_right

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Weave Left"): weave_left.emit()
	if event.is_action_pressed("Weave Right"): weave_right.emit()
	
	if event.is_action_pressed("Punch Left"): punch_left.emit()
	if event.is_action_pressed("Punch Right"): punch_right.emit()
