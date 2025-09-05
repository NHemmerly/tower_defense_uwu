class_name IdleState
extends TowerState

func enter(tow: Tower) -> void:
	tower = tow
	print("am I idle :3")

func update() -> State:
	if tower.target != null:
		return ShootingState.new()
	return
