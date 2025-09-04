class_name Level
extends Node2D

# Each level will include a unique array of a custom resource called "Wave"
# Each index of the array will be a wave and will be called "Waves"
@export var spawn: Marker2D
@export var end: Marker2D
@export var waves: Wave
@export var spawn_timer: float
@export var timer: Timer
var wave: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start(spawn_timer) 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass      
									

func spawn_mob() -> void:
	var new_mob = waves.enemies[wave].entity.instantiate()
	add_child(new_mob)
	new_mob.position = spawn.position
	new_mob.set_movement_target(end.global_position)
	wave += 1
		
	


func _on_timer_timeout() -> void:
	spawn_mob()
	timer.start(spawn_timer)
