class_name ShootingState
extends TowerState

func enter(turr: Turret) -> void:
	caller = turr
	
func update() -> State:
	if caller.target == null:
		return IdleState.new()
	return
