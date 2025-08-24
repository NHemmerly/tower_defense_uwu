class_name Target
extends Node2D

enum Targetting {FIRST, LAST, BIG, SMALL}


@export var Type: Targetting

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	target(Type)
	
func target(targetting: int):
	match targetting:
		Targetting.FIRST:
			first_targetting()
		Targetting.LAST:
			last_targetting()
		Targetting.BIG:
			big_targetting()
		Targetting.SMALL:
			small_targetting()
		_:
			first_targetting()

func first_targetting() -> void:
	pass
	
func last_targetting() -> void:
	pass
	
func big_targetting() -> void:
	pass
	
func small_targetting() -> void:
	pass
	
