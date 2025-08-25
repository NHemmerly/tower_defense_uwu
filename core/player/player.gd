class_name Player
extends Node2D

@export var tower_inv: TowerInv
@export var held_tower: TowerRes

var current_tile: Vector2i
var current_tile_data: TileData
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	$"canvas/Tower-selector".tower_inv = tower_inv
	$"canvas/Tower-selector".setup_bar()
	Events.map_tile_data.connect(_hover_pos)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$canvas/held_item.position = get_global_mouse_position()
	place_tower()


func place_tower() -> void:
	var current_scene = get_tree().current_scene
	var viewport = get_viewport().get_visible_rect()
	if viewport.has_point(get_global_mouse_position()) && \
	Input.is_action_just_pressed("click"):
		if current_tile_data.get_custom_data("Buildable"):
			var placed_tower = held_tower.tower_node.instantiate()
			current_scene.add_child(placed_tower)
			placed_tower.position = get_scene_position(current_tile)
		
func _on_towerselector_hold_new_tower(tower_item: TowerRes) -> void:
	print(tower_item)
	held_tower = tower_item
	$canvas/held_item.texture = held_tower.turret
	print(held_tower.name)
	
func _hover_pos(tile_coords: Vector2i, tile_data: TileData) -> void:
	current_tile = tile_coords
	current_tile_data = tile_data

func get_scene_position(tile_coords: Vector2i) -> Vector2:
	var scene_vector: Vector2 = Vector2((tile_coords.x * 32) + 16, \
										(tile_coords.y * 32) + 16) 
	return scene_vector

		
