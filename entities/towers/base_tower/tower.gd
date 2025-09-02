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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
	return targets[0]
	
func select_last() -> Entity:
	return targets[-1]
	
func select_largest() -> Entity:
	sort_targets_health()
	return targets[-1]
	
func select_smallest() -> Entity:
	sort_targets_health()
	return targets[0]
	
func sort_targets() -> void:
	targets.sort_custom(_sort_on_distance_to)
	
func sort_targets_health() -> void:
	targets.sort_custom(_sort_on_max_health)
	
func _sort_on_distance_to(creep_a: Entity, creep_b: Entity) -> bool:
	return creep_a.get_distance_to_end() < creep_b.get_distance_to_end()
 
func _sort_on_max_health(creep_a: Entity, creep_b: Entity) -> bool:
	return creep_a.get_max_health() < creep_b.get_max_health()
