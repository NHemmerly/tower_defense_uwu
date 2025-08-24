class_name BaseTile
extends TileMapLayer

signal cell_pos(cell_pos: Vector2i)

@export var selectors: Selector

const BUILDABLE_HIGHLIGHT: Vector2i = Vector2i(0, 1)
const UNBUILDABLE_HIGHLIGHT: Vector2i = Vector2i(1, 0)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var tile_pos = local_to_map(to_local(get_global_mouse_position()))
	var tile_data = get_cell_tile_data(tile_pos)
	highlight_tile(tile_pos, tile_data)
	print(tile_pos)
	cell_pos.emit(tile_pos)
	
func highlight_tile(cell: Vector2i, tile_data: TileData) -> void:
	selectors.clear()
	if tile_data.get_custom_data("Buildable"):
		selectors.set_cell(cell, 0, BUILDABLE_HIGHLIGHT)
	else:
		selectors.set_cell(cell, 0, UNBUILDABLE_HIGHLIGHT)
		
