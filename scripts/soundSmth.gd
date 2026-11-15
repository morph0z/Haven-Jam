extends Node
class_name SoundSMth


func _on_punch_left_box_hit() -> void:
	$"../Hurt2".play()

func _on_punch_right_box_hit() -> void:
	$"../Hurt2".play()



func _on_hurtbox_2d_hit(_damage: int) -> void:
	$"../Hurt".play()
