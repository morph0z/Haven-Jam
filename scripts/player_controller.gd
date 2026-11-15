class_name player
extends CharacterBody2D

@export var animated_sprite_2d: AnimatedSprite2D
@export var Ui:PlayerUi
@export var health_component: HealthComponent
@export var state_machine: StateMachine

const LOSE_SCREEN = preload("uid://cjymettq1p56y")

var combo:int = 0
var incTime = 0
func _ready() -> void:
	pass

func _on_timer_timeout() -> void:
	incTime += 1

func _process(_delta: float) -> void:
	Ui.combo_number = combo
	Ui.health_number = health_component.health
	Ui.incTime = incTime

func lose() -> void:
	get_tree().get_root().add_child(LOSE_SCREEN.instantiate())
	get_parent().queue_free()
