extends Button

const MAIN_SCENE = preload("uid://bule4khbiew2b")

func _on_pressed() -> void:
	get_tree().get_root().add_child(MAIN_SCENE.instantiate())
	get_parent().queue_free()
