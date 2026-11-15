extends Node
class_name EnemyHandler

@export var enemyList:Array[PackedScene]
var enemy_index:int = 0
@export var spawn_point:Marker2D
@export var player_ref:player

@export var bg_finish:ColorRect

func _ready() -> void:
	var first_enemy:Enemy2D = enemyList.get(0).instantiate()
	enemy_index = 0
	add_child(first_enemy)
	first_enemy.defeated.connect(on_defeated)
	first_enemy.bg_finish = bg_finish
	first_enemy.global_position = spawn_point.global_position

func on_defeated() -> void:
	enemy_index += 1
	if enemyList.get(enemy_index) == null:
		win()
		return
	
	var new_enemy:Enemy2D = enemyList.get(enemy_index).instantiate()
	add_child(new_enemy)
	new_enemy.bg_finish = bg_finish
	new_enemy.defeated.connect(on_defeated)
	new_enemy.global_position = spawn_point.global_position

func win():
	var win_screen = preload("uid://h2k2qcooc2lj").instantiate()
	win_screen.combo = player_ref.combo
	win_screen.time = player_ref.combo
	get_tree().get_root().add_child(win_screen)
	get_tree().get_root().get_child(0).get_child(3).queue_free()
