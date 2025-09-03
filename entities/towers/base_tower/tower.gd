class_name Tower
extends StaticBody2D

enum Targeting {
	FIRST, 
	LAST, 
	LARGEST, 
	SMALLEST
}

@export var turret: Turret
@export var target: Entity
@export var targets: Array[Entity]
@export var targeting: Targeting = Targeting.FIRST
@export var timer: Timer
@export var cooldown: float

var state: TowerState

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !state:
		state = IdleState.new()
		state.enter(self)
	var new_state = state.update()
	if new_state != null:
		state = new_state
		state.enter(self)
	select_targeting()
	
func select_targeting() -> void:
	if len(targets) > 0:
		sort_targets()
		match targeting:
			Targeting.FIRST:
				turret.set_target(select_first())
			Targeting.LAST:
				turret.set_target(select_last())
			Targeting.LARGEST:
				turret.set_target(select_largest())	
			Targeting.SMALLEST:
				turret.set_target(select_smallest())
	
func select_first() -> Entity:
	target = targets[0]
	return target
	
func select_last() -> Entity:
	target = targets[-1]
	return target
	
func select_largest() -> Entity:
	sort_targets_health()
	target = targets[-1]
	return targets[-1]
	
func select_smallest() -> Entity:
	sort_targets_health()
	target = targets[0]
	return targets[0]
	
func sort_targets() -> void:
	targets.sort_custom(_sort_on_distance_to)
	
func sort_targets_health() -> void:
	targets.sort_custom(_sort_on_max_health)
	
func _sort_on_distance_to(creep_a: Entity, creep_b: Entity) -> bool:
	return creep_a.get_distance_to_end() < creep_b.get_distance_to_end()
 
func _sort_on_max_health(creep_a: Entity, creep_b: Entity) -> bool:
	return creep_a.get_max_health() < creep_b.get_max_health()
