@tool

extends Area2D
class_name Hurtbox2D

@export var shape:Shape2D
@export var health_component:HealthComponent
@export var damage_num_pos: Marker2D
@export var damage_particles: CPUParticles2D

var disable:bool = false: 
	set(value):
		disable = value
		bounding_box.disabled = disable

var bounding_box:CollisionShape2D 

signal hit(damage:int)

func _ready() -> void:
	bounding_box = CollisionShape2D.new()
	bounding_box.shape = shape
	
	add_child(bounding_box)

func damage(amount:int) -> void:
	hit.emit(amount)
	health_component.health -= amount
	
	var damage_numbers:DamageNumbers = DamageNumbers.new()
	damage_numbers.number = amount
	damage_numbers.position = damage_num_pos.position
	damage_particles.emitting = true
	add_child(damage_numbers)
