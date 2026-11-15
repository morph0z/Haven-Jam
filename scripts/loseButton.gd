extends Button

@export var MAIN_SCENE = preload("uid://bule4khbiew2b")

func _ready() -> void:
	print("yo")
	MAIN_SCENE = preload("res://main_scene.tscn")
	print(MAIN_SCENE)
