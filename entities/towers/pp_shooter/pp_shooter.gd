extends Tower


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_range_area_body_entered(body: Node2D) -> void:
	if body is Entity:
		targets.append(body)

func _on_shoot_cooldown_timeout() -> void:
	turret.shoot(target)

func _on_range_area_body_exited(body: Node2D) -> void:
	if body is Entity:
		targets.erase(body)
