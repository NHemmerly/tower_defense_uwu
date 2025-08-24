class_name Entity
extends CharacterBody2D

@export var ent_name: String
@export_enum("enemy", "ally") var type

signal died()

func _on_health_died() -> void:
	died.emit()
	queue_free()
