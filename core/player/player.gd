class_name Player
extends Node2D

@export var tower_inv: TowerInv
@export var held_tower: TowerRes
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	$"canvas/Tower-selector".tower_inv = tower_inv
	$"canvas/Tower-selector".setup_bar()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$held_item.position = get_global_mouse_position()


func _on_towerselector_hold_new_tower(tower_item: TowerRes) -> void:
	print(tower_item)
	held_tower = tower_item
	$held_item.texture = held_tower.turret
	print(held_tower.name)
