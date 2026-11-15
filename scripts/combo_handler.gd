extends Node
class_name ComboHandler

@export var hitBox: Hitbox2D
@export var hurtbox: Hurtbox2D

@export var player_boxer: player

var combo_history:Array[int]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hitBox.hit.connect(combo_increase)
	hurtbox.hit.connect(combo_reset)

func combo_increase() -> void:
	player_boxer.combo += 1

func combo_reset(_damge:int) -> void:
	combo_history.append(player_boxer.combo)
	player_boxer.combo = 0
