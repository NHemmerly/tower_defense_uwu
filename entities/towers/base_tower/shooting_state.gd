class_name ShootingState
extends TowerState

func enter(tow: Tower) -> void:
	tower = tow
	tower.timer.start(tower.cooldown)
	print("I'm shooting")
	
func exit() -> void:
	tower.timer.stop()

func update() -> State:
	if tower.target == null:
		exit()
		return IdleState.new()
	return
