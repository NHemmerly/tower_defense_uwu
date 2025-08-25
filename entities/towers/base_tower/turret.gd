class_name Turret
extends Sprite2D

@export var targetting: Target
@export var range_area: RangeArea
@export var weapon: Weapon

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	range_area.get_child(0).shape.radius = weapon.range


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	rotate(PI/2)
