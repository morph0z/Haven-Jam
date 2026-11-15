@tool

extends Area2D
class_name Hitbox2D

@export var shape:Shape2D
@export var damage_values:DamageValues

@export var self_hurtbox:Hurtbox2D

signal hit

var disable:bool = true: 
	set(value):
		disable = value
		bounding_box.disabled = disable
		
var bounding_box:CollisionShape2D 

func _ready() -> void:
	bounding_box = CollisionShape2D.new()
	bounding_box.shape = shape
	bounding_box.debug_color = Color(1,0,0,0.5)
	disable = true
	
	add_child(bounding_box)
	area_entered.connect(hit_hurtbox)

func hit_hurtbox(area:Area2D) -> void:
	if area is Hurtbox2D:
		if area == self_hurtbox: return
		area.damage(damage_values.attack_damage)
		hit.emit()
