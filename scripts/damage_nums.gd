extends Label
class_name DamageNumbers

var number:int
const NEXT_BRAVO = preload("uid://px6mw6nvasd4")

func _ready() -> void:
	text = str(number)
	
	texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	z_index = 5
	
	var tween:Tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "position", Vector2(position.x, position.y - 5), 0.5)
	tween.tween_property(self, "position", Vector2(position.x, position.y + 5), 0.5).set_delay(0.2)
	tween.tween_property(self, "modulate", Color(1,1,1,0), 0.5)
	
	
	await tween.finished
	
	queue_free()
