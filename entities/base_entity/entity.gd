class_name Entity
extends CharacterBody2D

@export var ent_name: String
@export_enum("enemy", "ally") var type
@export var health: Health

signal died(entity: Entity)

func _ready() -> void:
	connect("died", Events._on_entity_died)

func _on_health_died() -> void:
	died.emit(self)
	queue_free()
