class_name Weapon
extends Node2D

@export var wep_name: String
@export_enum("projectile", "aoe") var type: int
@export var damage: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
