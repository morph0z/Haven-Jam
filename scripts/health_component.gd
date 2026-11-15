extends Node
class_name HealthComponent

@export var entity:Node2D

@export var max_health:int = 10
@export var health:int = 10: 
	set(value):
		health = value
		if health <= 0: death()
		if health > max_health: health = max_health

func death():
	if entity is player:
		entity.lose()
	elif entity is Enemy2D:
		entity.defeat()
