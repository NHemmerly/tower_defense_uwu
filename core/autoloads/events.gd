extends Node

@export var tile_size: int = 32

signal map_tile_data(tile_position: Vector2i, tile_data: TileData)
signal entity_died(entity: Entity)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _get_mouse_tile(cell_pos: Vector2i, tile_data: TileData) -> void:
	map_tile_data.emit(cell_pos, tile_data)
	
func _on_entity_died(entity: Entity):
	entity_died.emit(entity)
