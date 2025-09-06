class_name Health
extends Node2D

@export var max_health: float
@export var current_health: float

signal died()
signal health_changed(health: float)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health = max_health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	check_health_overflow()
	
func damage(amount: float) -> void:
	current_health -= amount
	if current_health <= 0.0:
		died.emit()
	health_changed.emit(amount)
	
func check_health_overflow() -> void:
	if current_health > max_health:
		current_health = max_health
