class_name IdleState
extends TowerState

func enter(turr: Turret) -> void:
	caller = turr

func update() -> State:
	if len(caller.targets) > 0:
		return ShootingState.new()
	return
