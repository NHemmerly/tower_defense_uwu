class_name ShootingState
extends TowerState

func enter(turr: Turret) -> void:
	caller = turr
	
func update() -> State:
	if len(owner.targets) < 1:
		return IdleState.new()
	return
