class_name Turret
extends Sprite2D

@export var muzzle: Marker2D
@export var bullet: BulletData
@export var damage: float
var state: TowerState
var target: Entity

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state = IdleState.new()
	state.enter(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if target != null:
		look_at(target.global_position)
		rotate(PI/2)
	var new_state = state.update()
	if new_state != null:
		state = new_state
		state.enter(self	)
		
func shoot() -> void:
	var current_scene = get_tree().current_scene
	var new_bullet = bullet.bullet.instantiate()
	new_bullet.data = bullet
	current_scene.add_child(new_bullet)
	new_bullet.set_target(target)
	new_bullet.damage = damage
	new_bullet.direction = muzzle.global_position - global_position
	new_bullet.global_position = muzzle.global_position

func set_target(entity: Entity) -> void:
	target = entity
