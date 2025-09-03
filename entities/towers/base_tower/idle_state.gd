class_name IdleState
extends TowerState

func enter(tow: Tower) -> void:
	tower = tow

func update() -> State:
	if tower.target != null:
		return ShootingState.new()
	return
