class_name IdleState
extends TowerState

func enter(turr: Turret) -> void:
	caller = turr

func update() -> State:
	if caller.target != null:
		return ShootingState.new()
	return
