class_name LevelEndArea
extends Area2D

signal enemy_entered(enemy: Entity)

func _ready() -> void:
	connect("enemy_entered", Events._on_entity_reaches_end)

func _on_body_entered(body: Node2D) -> void:
	if body is Entity:
		enemy_entered.emit(body)
		body.queue_free()
