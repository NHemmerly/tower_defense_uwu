class_name ShootingState
extends TowerState

func enter(tow: Tower) -> void:
	tower = tow
	tower.timer.start(tower.cooldown)
	
func update() -> State:
	if tower.target == null:
		return IdleState.new()
	return
