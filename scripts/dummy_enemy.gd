extends Enemy2D
@export var hitbox_2d: Hitbox2D
@export var hurtbox_2d: Hurtbox2D
enum RandomAttack{
	Left = 0,
	Right = 1
}

func _ready() -> void:
	hurtbox_2d.hit.connect(hit_back)

func hit_back(_amount:int) -> void:
	await warning(0.5)
	var rand:int = randi_range(0, 1)
	if rand == RandomAttack.Left:
		animated_sprite_2d.play("Hit left")
	if rand == RandomAttack.Right:
		animated_sprite_2d.play("Hit right")
	
	hitbox_2d.disable = false
	await animated_sprite_2d.animation_finished
	hitbox_2d.disable = true
