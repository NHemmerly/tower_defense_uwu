extends Tower

@export var cooldown: float
@export var timer: Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_range_area_mouse_entered() -> void:
	print("eat rats")

func _on_range_area_body_entered(body: Node2D) -> void:
	if body is Entity:
		target = body
		turret.set_target(target)
		timer.start(cooldown)

func _on_shoot_cooldown_timeout() -> void:
	turret.shoot()
