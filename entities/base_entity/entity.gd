class_name Entity
extends CharacterBody2D

@export var ent_name: String
@export_enum("enemy", "ally") var type
@export var health: Health
@export var nav_agent: NavigationAgent2D
@export var movement_speed: float

signal died(entity: Entity)

func _ready() -> void:
	nav_agent.velocity_computed.connect(Callable(_on_velocity_computed))
	connect("died", Events._on_entity_died)

func set_movement_target(movement_target: Vector2):
	nav_agent.set_target_position(movement_target)

func _physics_process(delta: float) -> void:
	if NavigationServer2D.map_get_iteration_id(nav_agent.get_navigation_map()) == 0:
		return
	if nav_agent.is_navigation_finished():
		return
	
	var next_path_position: Vector2 = nav_agent.get_next_path_position()
	var new_velocity: Vector2 = global_position.direction_to(next_path_position) \
	* movement_speed
	if nav_agent.avoidance_enabled:
		nav_agent.set_velocity(new_velocity)
	else:
		_on_velocity_computed(new_velocity)

func _on_velocity_computed(safe_velocity: Vector2):
	velocity = safe_velocity
	move_and_slide()

func _on_health_died() -> void:
	died.emit(self)
	queue_free()
