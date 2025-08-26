class_name RangeArea
extends Area2D

@export var range: float
@export var range_circle: CollisionShape2D

func _ready() -> void:
	if range_circle.shape == null:
		range_circle.shape = CircleShape2D.new()
	range_circle.shape.radius = range
	
	
func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	print("hey champ:) have a nice day")
